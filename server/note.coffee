Meteor.publishComposite 'notesTop', (limit, owner)->
  {
    find: ->
      selector = if owner? then {owner: owner} else {}
      Notes.find(selector, {limit: limit, fields: {content: 0}, sort: [['date', 'desc']]})
    children: [
      {
        find: (doc)->
          Meteor.users.find {_id: doc.owner}, {fields: {profileId: 1}}
        children: [
          {
            find: (doc)->
              Profiles.find {_id: doc.profileId}, {fields: {nickname: 1}}
          }
        ]
      }
      {
        find: (doc)->
          Images.find {_id: doc.pictures[0]}
      }
    ]
  }


#Meteor.publish 'notes', ->
#  Notes.find({})

Meteor.publishComposite 'note', (_id)->
  {
    find: ->
      Notes.find {_id: _id}
    children: [
      {
        find: (doc)->
          Meteor.users.find {_id: doc.owner}, {fields: {profileId: 1}}
        children: [
          {
            find: (doc)->
              Profiles.find {_id: doc.profileId}, {fields: {nickname: 1}}
          }
        ]
      }
      {
        find: (doc)->
          Images.find {_id: {$in: doc.pictures}}
      }
    ]
  }

checkOwner = (userId, doc)->
  userId == doc.owner

Notes.allow
  insert: checkOwner
  update: checkOwner
  remove: checkOwner

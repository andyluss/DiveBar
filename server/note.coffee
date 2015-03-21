Meteor.publishComposite 'notesTop', (limit, owner)->
  {
    find: ->
      selector = if owner? then {owner: owner} else {}
      Notes.find(selector, {limit: limit, fields: {content: 0}, sort: [['date', 'desc']]})
    children: [
      docUserComposite
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
      docUserComposite
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

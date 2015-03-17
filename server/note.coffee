Meteor.publishComposite 'notesTop', (limit, owner)->
  {
    find: ->
      selector = if owner? then {owner: owner} else {}
      Notes.find(selector, {limit: limit, fields: {content: 0}, sort: [['date', 'desc']]})
    children: [
      {
        find: (doc)->
          Meteor.users.find {_id: doc.owner}
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
          Meteor.users.find {_id: doc.owner}
      }
      {
        find: (doc)->
          Images.find {_id: {$in: doc.pictures}}
      }
    ]
  }

testFunc = (userId, doc)->
  userId == doc.owner

Notes.allow
  insert: testFunc
  update: testFunc
  remove: testFunc

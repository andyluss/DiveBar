Meteor.publishComposite 'notesTop', ->
  {
    find: ->
      Notes.find({}, {limit: 10, fields: {content: 0}, sort: [['date', 'desc']]})
    children: [
      {
        find: (note)->
          Meteor.users.find {_id: note.owner}
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
        find: (note)->
          Meteor.users.find {_id: note.owner}
      }
    ]
  }

Notes.allow
  insert: (userId, doc) ->
    userId == doc.owner
  update: (userId, doc, fields, modifier) ->
    userId == doc.owner
  remove: (userId, doc) ->
    userId == doc.owner
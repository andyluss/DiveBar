Meteor.publishComposite 'journeysTop', (category)->
  {
    find: ->
      Journeys.find({category: category}, {limit: 10, fields: {content: 0}, sort: [['createdAt', 'desc']]})
    children: [
      {
        find: (doc)->
          Meteor.users.find {_id: doc.owner}
      }
    ]
  }


#Meteor.publish 'journeys', ->
#  Journeys.find({})

Meteor.publishComposite 'journey', (_id)->
  {
    find: ->
      Journeys.find {_id: _id}
    children: [
      {
        find: (doc)->
          Meteor.users.find {_id: doc.owner}
      }
    ]
  }

Journeys.allow
  insert: (userId, doc) ->
    userId == doc.owner
  update: (userId, doc, fields, modifier) ->
    userId == doc.owner
  remove: (userId, doc) ->
    userId == doc.owner
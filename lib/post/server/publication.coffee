
@createTopPostsPublication = (name)->

  pluralCapName = plural s.capitalize name

  Meteor.publishComposite "top#{pluralCapName}", (limit, selector)->
    {
    find: ->
      selector ?= {}
      global[pluralCapName].find(selector, {limit: limit, fields: {content: 0}, sort: [['date', 'desc']]})
    children: [
      docUserComposite()
      {
        find: (doc)->
          Images.find {_id: doc.pictures[0]}
      }
    ]
    }

@createPostPublication = (name)->

  Meteor.publishComposite name, (_id)->
    {
    find: ->
      pluralCapName = plural s.capitalize name
      global[pluralCapName].find {_id: _id}
    children: [
      docUserComposite()
      {
        find: (doc)->
          Images.find {_id: {$in: doc.pictures}}
      }
    ]
    }



@createPostPublications = (name)->
  topPosts: createTopPostsPublication name
  post: createPostPublication name
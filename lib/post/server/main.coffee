@createPostPermission = (category)->
  coln(category).allow
    insert: checkUser
    update: checkUser
    remove: checkUser


Meteor.publishComposite 'postList', (selector, limit)->
  {
  find: ->
    category = selector.category
    # Count
    Counts.publish @, getCountName(selector), coln(category).find(_.omit(selector, 'category')), {noReady: true}

    selector = selectFavorites(selector)
    coln(category).find(_.omit(selector, 'category'), {limit: limit, fields: {content: 0}, sort: [['date', 'desc']]})

  children: [
    docUserComposite()
  ]
  }

Meteor.publishComposite 'post', (category, _id)->
  {
  find: ->
    # Comment count
    Counts.publish @, getCommentCountName(_id), Comments.get(_id)
    coln(category).find {_id: _id}
  children: [
    docUserComposite()
  ]
  }

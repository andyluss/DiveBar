@createPostPermission = (category)->
  coln(category).allow
    insert: checkPostPermission
    update: checkPostPermission
    remove: checkPostPermission

checkPostPermission = (userId, doc)->
  if hasCategory2(doc.category)
    if not doc.category2
      return false
    if (doc.category2 is getConfigs(doc.category).category2.official) and (not isAdmin(userId))
      return false
  return checkUser(userId, doc)

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


Meteor.publishComposite 'postList', (selector, limit)->
  {
  find: ->
    category = selector.category
    sel = _.omit selector, 'category'
    # Count
    Counts.publish @, getCountName(selector), coln(category).find(sel), {noReady: true}

    favoritesby = sel.favoritesby
    sel = _.omit sel, 'favoritesby'
    if favoritesby
      # TODO 可以改进
      favs = Favorites.find({user: favoritesby, category: category}).fetch()
      favs = _.pluck favs, 'doc'
      sel = _.extend sel, {_id: {$in: favs}}
    coln(category).find(sel, {limit: limit, fields: {content: 0}, sort: [['date', 'desc']]})

  children: [
    docUserComposite()
    {
      find: (doc)->
        # Comment count
        Counts.publish @, getCommentCountName(doc._id), Comments.get(doc._id), {noReady: true}
        # First Picture
        Images.find {creator: doc.creator}
    }
  ]
  }

Meteor.publishComposite 'post', (category, _id)->
  {
  find: ->
    coln(category).find {_id: _id}
  children: [
    docUserComposite()
    {
      find: (doc)->
        # Comment count
        Counts.publish @, getCommentCountName(doc._id), Comments.get(doc._id), {noReady: true}
        # Pictures
        Images.find {creator: doc.creator}
    }
  ]
  }

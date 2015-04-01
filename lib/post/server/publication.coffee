
Meteor.publishComposite 'postList', (selector, limit)->
  {
  find: ->
    category = selector.category
    sel = _.omit selector, 'category'
    # Count
    Counts.publish @, getCountName(selector), coln(category).find(sel), {noReady: true}

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


@createTopPostsPublication = (category)->

    Meteor.publishComposite "top#{pcap category}", (limit, category2, isMy)->
      {
      find: ->
        selector = {}
        selector.category2 = category2 if category2
        selector.owner = @userId if isMy
        # Count
        countName = getCountName category, category2, isMy
        Counts.publish @, countName, coln(category).find(selector), {noReady: true}

        coln(category).find(selector, {limit: limit, fields: {content: 0}, sort: [['date', 'desc']]})
      children: [
        docUserComposite()
        {
          find: (doc)->
            # Comment count
            Counts.publish @, getCommentCountName(doc._id), Comments.get(doc._id), {noReady: true}
            # First Picture
            Images.find {_id: doc.pictures[0]}
        }
      ]
      }

@createPostPublication = (category)->

  Meteor.publishComposite category, (_id)->
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
          Images.find {_id: {$in: doc.pictures}}
      }
    ]
    }

@createPostPublications = (category)->
  topPosts: createTopPostsPublication category
  post: createPostPublication category
Template.noteListItem.helpers
  firstImage: -> imageUrl @images?[0], {mode: 1, w: screen.width, h: 200, q: 80}

Template.noteListItem.events

  'click .content-container': -> Router.go "/post/detail?category=#{@category}&id=#{@_id}"

  'click .comment-button': -> Router.go "/post/comments?category=#{@category}&id=#{@_id}"

  'click .info-user': (event)->
    event.stopImmediatePropagation()
    Router.go userUrl(@user)

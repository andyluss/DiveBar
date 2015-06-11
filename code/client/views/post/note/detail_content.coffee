

Template.noteDetailContent.events

  'click .comment-button': -> Router.go "/post/comments?category=#{@category}&id=#{@_id}"

  'click .info-user': (event)->
    event.stopImmediatePropagation()
    Router.go userUrl(@user)
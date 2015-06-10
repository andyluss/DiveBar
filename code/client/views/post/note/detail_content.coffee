

Template.noteDetailContent.events

  'click .comment-button': -> Router.go "/post/comments?category=#{@category}&id=#{@_id}"
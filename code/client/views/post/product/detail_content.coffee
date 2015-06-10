Template.productDetailContent.helpers
  firstImage: -> imageUrl @images?[0], {mode: 1, w: 100, h: 100, q: 80}

Template.productDetailContent.events

  'click .comment-button': -> Router.go "/post/comments?category=#{@category}&id=#{@_id}"
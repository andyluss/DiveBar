Template.productUserItem.helpers
  commentCount: -> Counts.get getCommentCountName(@_id)
  firstPictureThumb: -> imageUrl(@images?[0], {mode: 1, w: 96})

Template.productUserItem.events
  'click': (event, template)-> Router.go "/post/detail?category=#{@category}&id=#{@_id}"
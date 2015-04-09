Template.productUserItem.helpers
  commentCount: -> Counts.get getCommentCountName(@_id)

Template.productUserItem.events
  'click': (event, template)-> Router.go "/post/detail?category=#{@category}&id=#{@_id}"
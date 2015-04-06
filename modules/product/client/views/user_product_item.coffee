Template.userProductItem.helpers
  commentCount: ->
    Counts.get getCommentCountName(@_id)

Template.userProductItem.events
  'click .product-item.user': ()->
    Router.go "/post/detail?category=#{@category}&id=#{@_id}"
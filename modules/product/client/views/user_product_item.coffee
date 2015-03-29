Template.userProductItem.helpers
  commentCount: ->
    Counts.get getCommentCountName(@_id)

Template.userProductItem.events
  'click .product-item.user': ()->
    Router.go "product.detail", {id: @_id}
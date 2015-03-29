Template.userProductItem.helpers
  commentCount: ->
    Comments.session.get(@id + '_count');

Template.userProductItem.events
  'click .product-item.user': ()->
    Router.go
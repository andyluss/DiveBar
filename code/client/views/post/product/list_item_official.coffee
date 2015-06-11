Template.productListItemOfficial.helpers
  firstImage: -> imageUrl @images?[0], {mode: 1, w: screen.width, h: 200, q: 80}

Template.productListItemOfficial.events

  'click': -> Router.go "/post/detail?category=#{@category}&id=#{@_id}"


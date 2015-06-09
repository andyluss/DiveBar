Template.imageItem.helpers
  firstPicture: -> imageUrl @images?[0], {mode: 1, w: screen.width, h: 200, q: 80}

Template.imageItem.events
  'click .image-item': -> Router.go "/post/detail?category=#{@category}&id=#{@_id}"
  'click .image-item .user': (event)->
    event.stopImmediatePropagation()
    Router.go userUrl(@user)
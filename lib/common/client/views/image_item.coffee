Template.imageItem.events

  'click .image-item': ->
    Router.go "/post/detail?category=#{@category}&id=#{@_id}"

  'click .image-item .user': (event)->
    event.stopImmediatePropagation()
    Router.go userUrl(@user)
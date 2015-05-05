Template.imageItemNote.helpers
  firstPicture: -> imageUrl @images?[0], {mode: 2, w: screen.width, h: screen.width * 0.8, q: 100}

Template.imageItemNote.events
  'click .image-item-note': -> Router.go "/post/detail?category=#{@category}&id=#{@_id}"
  'click .image-item-note .user': (event)->
    event.stopImmediatePropagation()
    Router.go userUrl(@user)
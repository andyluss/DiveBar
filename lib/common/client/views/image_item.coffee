Template.imageItem.events

  'click .image-item': ->
    Router.go @category + ".detail", {id: @_id}

  'click .image-item .owner': (event)->
    event.stopImmediatePropagation()
    Router.go userUrl(@owner)
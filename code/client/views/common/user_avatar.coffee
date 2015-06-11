Template.userAvatar.events
  'click': ->
    event.stopImmediatePropagation()
    Router.go userUrl(@)
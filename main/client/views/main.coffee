Template.ionNavBar.events

  'click [data-action=my-data]': (event, template)->
    preMainRoute Router.current().route.getName()
    Router.go 'profile', {user: myId(), type: 'main'}

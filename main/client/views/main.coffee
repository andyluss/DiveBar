Template.ionNavBar.events

  'click [data-action=my-data]': (event, template)->
    preMainRoute Router.current().route.getName()
    Router.go 'my.card'

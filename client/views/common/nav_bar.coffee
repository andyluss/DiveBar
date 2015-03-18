Template.ionNavBar.events

  'click [data-action=my-data]': (event, template)->
    Session.set SessionKeys.preRoute, Router.current().route.getName()
    Router.go 'my.card'

  'click [data-action=logout]': (event, template)->
    Meteor.logout ->
      Router.go(Session.get(SessionKeys.preRoute) or 'note.list')

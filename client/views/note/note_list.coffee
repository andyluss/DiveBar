Template.noteList.rendered = ->
  Session.set SessionKeys.currentTab, 'note.list'

Template.ionNavBar.events
  'click [data-action=myData]': (event, template)->
    Session.set SessionKeys.preRoute, Router.current().route.getName()
    Router.go 'my.card'
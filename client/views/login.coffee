Template.ionNavBar.events

  'click [data-action=skip-login]': (event, template)->
    Router.go 'note.list'

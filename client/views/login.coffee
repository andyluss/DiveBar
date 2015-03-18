Template.ionNavBar.events

  'click [data-action=skipLogin]': (event, template)->
    Router.go 'note.list'

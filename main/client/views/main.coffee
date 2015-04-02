Template.ionNavBar.events

  'click [data-action=my-data]': (event, template)->
    preMainRoute currentUrl()
    Router.go "/profile?type=main&user=#{myId()}"

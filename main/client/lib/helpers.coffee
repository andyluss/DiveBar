@preMainRoute = (value)->
  key = 'preMainRoute'
  if value?
    Session.set key, value
  else
    if not Session.get key
      Session.set key, 'note.list'
    Session.get key

Template.registerHelper 'preMainRoute', ->
  preMainRoute()
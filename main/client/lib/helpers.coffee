@preMainRoute = (value)->
  key = 'preMainRoute'
  if value?
    Session.set key, value
  else
    if not Session.get key
      Session.set key, "/post/list?category=#{PostCategory.note}"
    Session.get key

Template.registerHelper 'preMainRoute', ->
  preMainRoute()
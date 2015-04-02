@preMainRoute = (value)->
  key = 'preMainRoute'
  if value?
    Session.set key, value
  else
    if not Session.get key
      Session.set key, "/"
    Session.get key

Template.registerHelper 'preMainRoute', ->
  return '/' # TODO 返回导航是个大问题
#  preMainRoute()
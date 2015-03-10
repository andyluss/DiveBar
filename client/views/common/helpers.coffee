Template.registerHelper "absoluteUrl", (path)->
  Meteor.absoluteUrl path

Template.registerHelper "currentRouteIs", (name)->
  current = Router.current()
  current and current.route and current.route.getName() == name or false

Template.registerHelper "currentRouteType", ->
  current = Router.current()
  current and current.route and current.route.getName() and current.route.getName().split('.')[0]

Template.registerHelper "activeRoute", (name)->
  current = Router.current()
  current and current.route and current.route.getName() == name and "active" or ""

Template.registerHelper 'dateString', (date)->
  moment(date).format('YYYY/M/D')

Template.registerHelper 'firstOne', (array)->
    if array and array.length > 0 then array[0] else ''

Template.registerHelper 'userName', (userId)->
  user = Meteor.users.findOne(userId)
  if user
    user.nickname or user.username or user.emails[0].address.split('@')[0]
  else
    '游客'

Template.registerHelper 'userUrl', (userId)->
  '/user/' + userId

Template.registerHelper 'firstPicture', ->
    if @pictures and @pictures.length > 0
      console.log @pictures[0]
      image = Images.findOne(@pictures[0])
      if image then getImageUrl(image) else ''
    else
      ''
      
@getImageUrl = (image)->
  'cfs/files/images/' + image.copies.images.key

@currentRoute = ->
  current = Router.current()
  current and current.route and current.route.getName() or ''

@currentRouteQuery = ->
  current = Router.current()
  current and current.getParams().query or {}

@currentUrl = -> Iron.Location.get().path

@userUrl = (userId)->
  "/profile?user=#{userId}"

@getListLimit = (selector)->
  sel = JSON.stringify selector
  category = sel.category
  if not getConfigs(category)["listLimit_#{sel}"]
    getConfigs(category)["listLimit_#{sel}"] = new ReactiveVar 10
  return getConfigs(category)["listLimit_#{sel}"]

@back = ->
  backButton = $('.ionic-body .nav-bar-block .back-button')[0]
  $(backButton).click()

@imagesUploaded = (creator)->
  return Images.find {creator: creator}

@newImageCreator = ->
  Meteor.userId() + '-' + new Date().getTime()

Template.registerHelper 'users', ->
  Meteor.users

Template.registerHelper "absoluteUrl", (path)->
  Meteor.absoluteUrl path

Template.registerHelper "currentRoute", -> currentRoute()

Template.registerHelper "currentRouteIs", (name)-> currentRoute() is name

Template.registerHelper "currentRouteCategory", -> currentRouteQuery()?.category

Template.registerHelper "activeRoute", (name)-> (currentRoute() is name) and 'active' or ''

Template.registerHelper 'dateString', (date)->
  moment(date).format('YYYY/M/D')

Template.registerHelper 'firstOne', (array)->
    if array and array.length > 0 then array[0] else ''

Template.registerHelper 'userName', (userId)->
  user = userById userId
  if user
    profile = userProfile userId
    profile and profile.nickname or user.username or user.emails[0].address.split('@')[0]
  else
    '游客'

Template.registerHelper 'userUrl', (userId)-> userUrl userId

Template.registerHelper 'imageUrl', (image)-> imageUrl image

Template.registerHelper 'firstPicture', ->
  imageUrl firstImagesByCreator(@creator)

Template.registerHelper 'firstPictureThumb', ->
  imageUrl firstImagesByCreator(@creator), 'thumbs'

Template.registerHelper 'mergeItemTemplate', (itemTemplate)->
  _.extend @, {itemTemplate: itemTemplate}
@qiniuImageInfo = (key, info)->
  if info and key and Qiniu and qiniuConfig.DOMAIN
    info.src = Qiniu.getUrl(key)
    HTTP.get (info.src + '?imageInfo'), (error, result)->
      if error
        console.log error
      else if result.statusCode is 200
        info.w = result.data.width
        info.h = result.data.height

@subscribeMyFavorites = ->
  subsManager.subscribe 'favoritesByUser', myId()

@currentRoute = ->
  current = Router.current()
  current and current.route and current.route.getName() or ''

@currentRouteQuery = ->
  current = Router.current()
  current and current.getParams().query or {}

@currentLocation = -> Iron.Location.get()

@currentPath = -> currentLocation().path

@currentUrl = -> Meteor.absoluteUrl currentPath().slice(1)

@getListLimit = (selector)->
  sel = JSON.stringify selector
  category = sel.category
  if not getConfigs(category)["listLimit_#{sel}"]
    getConfigs(category)["listLimit_#{sel}"] = new ReactiveVar 10
  return getConfigs(category)["listLimit_#{sel}"]

@back = -> window.history.back();

Template.registerHelper 'users', -> Users

Template.registerHelper 'isMe', (userId)-> isMe(userId or @user)

Template.registerHelper "absoluteUrl", (path)->
  Meteor.absoluteUrl path

Template.registerHelper "currentRoute", -> currentRoute()

Template.registerHelper "currentRouteIs", (name)-> currentRoute() is name

Template.registerHelper "activeRoute", (name)-> (currentRoute() is name) and 'active' or ''

Template.registerHelper 'dateString', (date, format)-> (typeof format is 'string') and dateString(date, format) or dateString(date)

Template.registerHelper 'firstOne', (array)->
    if array and array.length > 0 then array[0] else ''

Template.registerHelper 'userName', (userId)-> userName userId

Template.registerHelper 'userUrl', (userId)-> userUrl userId

Template.registerHelper 'avatarUrl', (userId)-> avatarUrl userId

Template.registerHelper 'imageUrl', (image)-> imageUrl image

#Template.registerHelper 'firstPicture', (images)->
##  ratio = window.devicePixelRatio or 1
#  imageUrl images?[0], {mode: 2, w: screen.width, h: screen.width * 0.8, q: 100}

Template.registerHelper 'mergeItemTemplate', (itemTemplate)-> _.extend @, {itemTemplate: itemTemplate}

Template.registerHelper 'userPrefix', (userId, showName, isFavorite)-> userPrefix(userId, showName, isFavorite)
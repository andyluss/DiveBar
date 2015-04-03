@subscribeMyFavorites = ->
  subManager.subscribe 'favoritesByUser', myId()

@noTransition = (data)->
  if _.isObject data
    data.transition = 'none'
  return data

@currentRoute = ->
  current = Router.current()
  current and current.route and current.route.getName() or ''

@currentRouteQuery = ->
  current = Router.current()
  current and current.getParams().query or {}

@currentPath = -> Iron.Location.get().path

@getListLimit = (selector)->
  sel = JSON.stringify selector
  category = sel.category
  if not getConfigs(category)["listLimit_#{sel}"]
    getConfigs(category)["listLimit_#{sel}"] = new ReactiveVar 10
  return getConfigs(category)["listLimit_#{sel}"]

@back = ->
  backButton = $('.ionic-body .nav-bar-block .back-button')[0]
  $(backButton).click()

@imagesUploaded = (creator)-> Images.find {creator: creator}

@newImageCreator = -> myId() + '-' + new Date().getTime()

Template.registerHelper 'users', -> Users

Template.registerHelper 'isMe', (userId)-> isMe(userId or @user)

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

Template.registerHelper 'userName', (userId)-> userName userId

Template.registerHelper 'userUrl', (userId)-> userUrl userId

Template.registerHelper 'avatarUrl', (userId)-> avatarUrl userId

Template.registerHelper 'imageUrl', (image, store)->
  if not _.isString store
    store = undefined
  imageUrl image, store

Template.registerHelper 'firstPicture', ->
  imageUrl firstImagesByCreator(@creator)

Template.registerHelper 'firstPictureThumb', ->
  imageUrl firstImagesByCreator(@creator), ImageStores.thumbs

Template.registerHelper 'mergeItemTemplate', (itemTemplate)->
  _.extend @, {itemTemplate: itemTemplate}
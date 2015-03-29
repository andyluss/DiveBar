


@getTopLimit = (category, category2, isMy)->
  category ?= ''
  category2 ?= ''
  my = isMy and 'My' or ''
  pcCategory = category and plural s.capitalize category or ''
  capCategory2 = category2 and s.capitalize category2 or ''
  if not getConfigs(category)["top#{my}#{pcCategory}#{capCategory2}Limit"]
    getConfigs(category)["top#{my}#{pcCategory}#{capCategory2}Limit"] = new ReactiveVar 10
  return getConfigs(category)["top#{my}#{pcCategory}#{capCategory2}Limit"]

@back = ->
  backButton = $('.ionic-body .nav-bar-block .back-button')[0]
  $(backButton).click()

@imagesUploaded = (creator)->
  Images.find {creator: creator}

@newImageCreator = ->
  Meteor.userId() + '-' + new Date().getTime()

Template.registerHelper 'users', ->
  Meteor.users

Template.registerHelper "absoluteUrl", (path)->
  Meteor.absoluteUrl path

Template.registerHelper "currentRoute", ->
  current = Router.current()
  current and current.route and current.route.getName() or ''

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
  user = userById userId
  if user
    profile = userProfile userId
    profile and profile.nickname or user.username or user.emails[0].address.split('@')[0]
  else
    '游客'

Template.registerHelper 'userUrl', (userId)->
  '/user/' + userId

Template.registerHelper 'imageUrl', imageUrl

Template.registerHelper 'firstPicture', ->
  if @pictures and @pictures.length > 0
    imageUrl @pictures[0]
  else
    ''

Template.registerHelper 'mergeItemTemplate', (itemTemplate)->
  _.extend this, {itemTemplate: itemTemplate}
Template.postList.onCreated ->
  setCategory2Events @data.category

Template.postList.helpers

  title: ->
    prefix = ''
    if @user
      if @user is myId()
        prefix = '我的'
      else
        prefix = userName(@user) + '的'
    return prefix + getConfigs(@category).label

  title2: -> getConfigs(Template.parentData().category).category2Label[@]

  isSelect: (category2)->
    routeCat2 = currentRouteQuery().category2
    if routeCat2
      routeCat2 == category2 and 'selected' or ''
    else
      category2 == getConfigs(Template.parentData().category).category2Default and 'selected' or ''

  category2s: -> _.values getConfigs(@category).category2

Template.ionNavBar.events

  'click [data-action=my-data]': (event, template)->
    preMainRoute currentUrl()
    user = myId()? and "&user=#{myId()}" or ''
    Router.go "/profile?type=main" + user

setCategory2Events = (category)->
  events = {}
  _.each getConfigs(category).category2, (category2)->
    events["click .#{category}.#{category2}"] = ->
      Router.go "/post/list?category=#{category}&category2=#{category2}"
  Template.postList.events events
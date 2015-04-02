Template.postList.onCreated ->
  if @data.category2
    setEvents @data.category

Template.postList.helpers

  isUsers: -> @user?

  title: ->
    (if @user is myId() then '我的' else '') + getConfigs(@category).label

  title2: ->
    getConfigs(@parentData().category).category2Label[@]

  isSelect: (category2)->
    currentRouteQuery().category2 == category2 and 'selected' or ''

  category2s: -> getConfigs(@category).category2

setEvents = (category)->
  events = {}
  _.each getConfigs(category).category2, (category2)->
    events["click .#{category}.#{category2}"] = ->
      Router.go "/post/list?category=#{category}&category2=#{category2}"
  Template.postList.events events
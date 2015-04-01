Template.postList.onCreated ->
  if @data.category2
    setEvents @data.category

Template.postList.helpers

  isUsers: -> @user?

  title: ->
    console.log @category
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
      query = {}
      query.category = category
      query.category2 = category2
      console.log($.param query)
      Router.go 'post.list', {query: $.param query}
  Template.postList.events events
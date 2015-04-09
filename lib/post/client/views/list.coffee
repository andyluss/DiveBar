Template.postList.helpers

  title: -> userPrefix(@user, true, @favoritesby?) + getConfigs(@category).label

  title2: -> getConfigs(Template.parentData().category).category2Label[@]

  isSelect: (category2)->
    routeCat2 = currentRouteQuery().category2
    if routeCat2
      routeCat2 == category2 and 'selected' or ''
    else
      category2 == getConfigs(Template.parentData().category).category2Default and 'selected' or ''

  category2s: ->
    if hasCategory2(@category)
      _.values getConfigs(@category).category2

  showCategory2s: -> hasCategory2(@category) and not @user and not @favoritesby

Template.ionNavBar.events

  'click [data-action=my-data]': (event, template)->
    preMainRoute currentPath()
    user = myId()? and "&user=#{myId()}" or ''
    Router.go "/profile?type=main" + user

  'click [data-action=favoritesby]': (event, template)->
#    setPostList 'favoritesby', myId()
    Router.go(currentPath() + "&favoritesby=#{myId()}")

Template.postList.events
  'click .category2': -> Router.go "/post/list?category=#{Template.parentData().category}&category2=#{@}"

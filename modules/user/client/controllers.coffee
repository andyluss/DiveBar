@UserListController = ContentController.extend
  onAfterAction: ->
    selector = paramsQuery(@)
    selector.category = 'user'
    subsManager.subscribe "userList", selector, getListLimit(selector).get(), -> gbl()["loadingMore"].set false
    subscribeMyFavorites()
  data: ->
    selector = paramsQuery(@)
    data = _.clone selector
    selector.category = 'user'
    selector = selectFavorites(selector)
    selector = _.omit selector, 'category'
    data.list = Users.find selector
    data.itemTemplate = 'userListItem'
    return data

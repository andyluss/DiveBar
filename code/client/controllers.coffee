
pq = (context)-> paramsQuery context


@ContentController = RouteController.extend
  layoutTemplate: 'layoutContent'




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
    return data


@SearchController = ContentController.extend
  data: -> paramsQuery @


@CertificateListController = ContentController.extend
  onAfterAction: ->
    selector = pq(@)
    subsManager.subscribe "certificateList", selector
  data: ->
    selector = pq(@)
    data = _.clone selector
    data.list = Certificates.find selector, {sort: {date: -1}}
    return data

@CertificateDetailController = ContentController.extend
  onAfterAction: -> subsManager.subscribe 'certificate', pq(@).id
  data: -> Certificates.findOne({_id: pq(@).id})

@CertificateCreatorController = ContentController.extend
  data: -> pq(@)

@CertificateUpdaterController = ContentController.extend
  data: -> Certificates.findOne({_id: pq(@).id})




@ProfileController = ContentController.extend
  action: -> @render "profile#{cap(paramsQuery(@).type or 'main')}"
  waitOn: ->
    subsManager.subscribe 'user', paramsQuery(@).user or myId()
    subsManager.subscribe 'profile', paramsQuery(@).user or myId()
    subscribeMyFavorites()
  data: -> Profiles.findOne({user: paramsQuery(@).user or myId()})





loading = false

@PostListController = ContentController.extend
  action: ->
    if pq(@).user
      @render 'postListUser'
    else
      @render 'postListAll'
  onAfterAction: ->
    setDefaultCategory2.call @
    selector = pq(@)
    if not loading
      IonLoading.show({customTemplate: '<i class="icon ion-loading-a"></i>'})
      loading = true
    subsManager.subscribe "postList", selector, getListLimit(selector).get(), ->
      gbl()["loadingMore"].set false
      IonLoading.hide()
    subscribeMyFavorites()
  data: ->
    setDefaultCategory2.call @
    selector = pq(@)
    data = _.clone selector
    selector = selectFavorites(selector)
    data.list = Posts.find selector, {sort: [['createdAt', 'desc']]}
    return data

@PostDetailController = ContentController.extend
  onAfterAction: ->
    subsManager.subscribe 'post', pq(@).category, pq(@).id
    subscribeMyFavorites()
  data: -> Posts.findOne({_id: pq(@).id})

@PostCommentsController = ContentController.extend
  onAfterAction: -> subsManager.subscribe 'post', pq(@).category, pq(@).id
  data: -> Posts.findOne({_id: pq(@).id})

@PostCreatorController = ContentController.extend
  data: -> pq(@)

@PostUpdaterController = ContentController.extend
  data: -> Posts.findOne({_id: pq(@).id})

setDefaultCategory2 = ->
  if (not pq(@).category2?) and hasCategory2 pq(@).category
    config = getConfigs(pq(@).category)
    pq(@).category2 = config.category2.official

getListItemTemplate = (selector)->
  cfg = getConfigs selector.category
  return cfg.itemTemplate[selector.category2] or cfg.itemTemplate
loading = false

@PostListController = ContentController.extend
  onAfterAction: ->
    setDefaultCategory2.call @
    selector = pq(@)
    if not loading
      console.log 'loading'
      IonLoading.show()
      loading = true
    subsManager.subscribe "postList", selector, getListLimit(selector).get(), ->
      gbl()["loadingMore"].set false
      IonLoading.hide()
      console.log 'loaded'
    subscribeMyFavorites()
  data: ->
    setDefaultCategory2.call @
    selector = pq(@)
    data = _.clone selector
    selector = selectFavorites(selector)
    data.list = coln(selector.category).find selector, {sort: {date: -1}}
    data.itemTemplate = getListItemTemplate(selector)
    return data

@PostDetailController = ContentController.extend
  onAfterAction: ->
    subsManager.subscribe 'post', pq(@).category, pq(@).id
    subscribeMyFavorites()
  data: -> coln(pq(@).category).findOne({_id: pq(@).id})

@PostCreatorController = ContentController.extend
  data: -> pq(@)

@PostUpdaterController = ContentController.extend
  data: -> coln(pq(@).category).findOne({_id: pq(@).id})

pq = (context)-> paramsQuery context
  
getListItemTemplate = (selector)->
  cfg = getConfigs selector.category
  return cfg.itemTemplate[selector.category2] or cfg.itemTemplate

setDefaultCategory2 = ->
  if (not pq(@).category2?) and hasCategory2 pq(@).category
    config = getConfigs(pq(@).category)
    pq(@).category2 = config.category2.official
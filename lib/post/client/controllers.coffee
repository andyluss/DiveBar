@PostListController = ContentController.extend
  onAfterAction: ->
    checkCategory2.call(@)
    selector = pq(@)
    subManager.subscribe "postList", selector, getListLimit(selector).get(), -> gbl()["loadingMore"].set false
  data: ->
    checkCategory2.call(@)
    selector = pq(@)
    category = selector.category
    data = _.clone selector
    selector = _.omit selector, 'favoritesby'
    data.list = coln(category).find selector, {sort: {date: -1}}
    data.itemTemplate = getListItemTemplate(selector)
#    data.transition = 'none'
    return data

@PostDetailController = ContentController.extend
  onAfterAction: ->
    subManager.subscribe 'post', pq(@).category, pq(@).id
    subManager.subscribe 'favoritesByUser', myId()
  data: ->
    coln(pq(@).category).findOne({_id: pq(@).id})

@PostCreatorController = ContentController.extend
  data: -> pq @

@PostUpdaterController = ContentController.extend
  data: -> coln(pq(@).category).findOne({_id: pq(@).id})

getListItemTemplate = (selector)->
  cfg = getConfigs selector.category
  return cfg.itemTemplate[selector.category2] or cfg.itemTemplate

checkCategory2 = ->
  if (not pq(@).category2?) and hasCategory2 pq(@).category
    config = getConfigs(pq(@).category)
    pq(@).category2 = config.category2Default
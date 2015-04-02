@PostListController = ContentController.extend
  onBeforeAction: ->
    if (not pq(@).category2?) and hasCategory2 pq(@).category
      pq(@).category2 = getConfigs(pq(@).category).category2Default
    @next()
  onAfterAction: ->
    selector = pq(@)
    subManager.subscribe "postList", selector, getListLimit(selector).get(), -> gbl()["loadingMore"].set false
  data: ->
    selector = pq(@)
    category = selector.category
    data = _.clone selector
    data.list = coln(category).find selector, {sort: {date: -1}}
    data.itemTemplate = getListItemTemplate(selector)
#    data.transition = 'none'
    return data

getListItemTemplate = (selector)->
  cfg = getConfigs selector.category
  return cfg.itemTemplate[selector.category2] or cfg.itemTemplate

@PostDetailController = ContentController.extend
  onAfterAction: ->
    subManager.subscribe 'post', pq(@).category, pq(@).id
    subManager.subscribe 'favoritesByUser', Meteor.userId()
  data: ->
    coln(pq(@).category).findOne({_id: pq(@).id})

@PostCreatorController = ContentController.extend
  data: -> pq @

@PostUpdaterController = ContentController.extend
  data: -> coln(pq(@).category).findOne({_id: pq(@).id})

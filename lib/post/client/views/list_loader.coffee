Template.listLoader.rendered = ->
  template = @
  @autorun ->
    if gbl()["loadingMore"].get()
      template.$('.loadmore-button').addClass('loading').html('加载中')
    else
      template.$('.loadmore-button').removeClass('loading').html('更多')

Template.listLoader.helpers

  hasMore: ->
    selector = getSelector @
    return Counts.get(getCountName selector) > getListLimit(selector).get()

Template.listLoader.events

  'click .loadmore-button': (event, template)->
    gbl()["loadingMore"].set true

    limit = getListLimit(getSelector(@))
    limit.set limit.get() + 10

getSelector = (context)->
  return {
    category: context.category
    category2: context.category2
    user: context.user
  }
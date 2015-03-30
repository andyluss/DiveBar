Template.listLoader.rendered = ->

  category = @data.category
  category2 = @data.category2
  isMy = @data.isMy

  selector = {}
  if isMy
    selector.owner = Meteor.user()
  if category2
    selector.category2 = category2

  template = this
  @autorun ->
    if gbl()["loadingMore"].get()
      template.$('.loadmore-button').addClass('loading').html('加载中')
    else
      template.$('.loadmore-button').removeClass('loading').html('更多')


Template.listLoader.helpers

  hasMore: ->
    return Counts.get(getCountName(@category, @category2, @isMy)) > getTopLimit(@category, @category2, @isMy).get()

Template.listLoader.events

  'click .loadmore-button': (event, template)->
    gbl()["loadingMore"].set true

    limit = getTopLimit(@category, @category2, @isMy)
    limit.set limit.get() + 10
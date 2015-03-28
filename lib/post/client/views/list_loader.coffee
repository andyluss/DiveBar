getItemCount = (category, category2, isMy)->
  category ?= ''
  category2 ?= ''
  my = isMy and 'my' or ''
  pcCategory = category and plural s.capitalize category or ''
  capCategory2 = category2 and s.capitalize category2 or ''
  if not getConfigs(category)["#{my}#{pcCategory}#{capCategory2}ItemCount"]
    getConfigs(category)["#{my}#{pcCategory}#{capCategory2}ItemCount"] = new ReactiveVar 0
  return getConfigs(category)["#{my}#{pcCategory}#{capCategory2}ItemCount"]

Template.listLoader.rendered = ->

  category = @data.category
  category2 = @data.category2
  isMy = @data.isMy

  selector = {}
  if isMy
    selector.owner = Meteor.user()
  if category2
    selector.category2 = category2

  Meteor.call "#{category}Count", selector, (error, result)->
    getItemCount(category, category2, isMy).set result if result?

  template = this
  @autorun ->
    if gbl()["loadingMore"].get()
      template.$('.loadmore-button').addClass('loading').html('加载中')
    else
      template.$('.loadmore-button').removeClass('loading').html('更多')


Template.listLoader.helpers

  hasMore: ->
    return getItemCount(@category, @category2, @isMy).get() > getTopLimit(@category, @category2, @isMy).get()

Template.listLoader.events

  'click .loadmore-button': (event, template)->
    gbl()["loadingMore"].set true

    limit = getTopLimit(@category, @category2, @isMy)
    limit.set limit.get() + 10
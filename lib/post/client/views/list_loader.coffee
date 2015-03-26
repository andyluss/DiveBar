itemCount = new ReactiveVar(0)

Template.listLoader.rendered = ->

  category = @data.category

  Meteor.call "#{category}Count", @data.owner, (error, result)->
    itemCount.set result if result?

  template = this
  @autorun ->
    if window["loadingMore"].get()
      template.$('.loadmore-button').addClass('loading').html('加载中')
    else
      template.$('.loadmore-button').removeClass('loading').html('更多')


Template.listLoader.helpers

  hasMore: ->
    return itemCount.get() > getTopLimit(@category, @category2).get()

Template.listLoader.events

  'click .loadmore-button': (event, template)->
    window["loadingMore"].set true

    limit = getTopLimit(@category, @category2)
    limit.set limit.get() + 10
itemCount = new ReactiveVar(0)

Template.listLoader.rendered = ->
  category = @data.category

  Meteor.call "#{category}Count", @data.owner, (error, result)->
    itemCount.set result if result?

  template = this
  @autorun ->
    if Vars.loadingMore.get()
      template.$('.loadmore-button').addClass('loading').html('加载中')
    else
      template.$('.loadmore-button').removeClass('loading').html('更多')


Template.listLoader.helpers
  hasMore: ->
    limit = ''
    pluralCategory = plural s.capitalize @category
    if @category2
      category2 = s.capitalize @category2
      limit = "top#{pluralCategory}#{category2}Limit"
    else
      limit = "top#{pluralCategory}Limit"
    return itemCount.get() > Vars[limit].get()


Template.listLoader.events
  'click .loadmore-button': (event, template)->
    Vars.loadingMore.set true

    limit = ''
    category = plural s.capitalize @category
    if @category2
      category2 = s.capitalize @category2
      limit = "top#{category}#{category2}Limit"
    else
      limit = "top#{category}Limit"

    Vars[limit].set Vars[limit].get() + 10
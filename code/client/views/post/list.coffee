Template.postList.rendered = ->
  template = @
  @autorun ->
    if gbl()["loadingMore"].get()
      template.$('.loadmore-button').addClass('loading').html('加载中')
    else
      template.$('.loadmore-button').removeClass('loading').html('更多')

Template.postList.helpers

  itemTemplate: -> "#{@category}ListItem#{cap @category2 or ''}"

  title: -> userPrefix(@user, true, @favoritesby?) + getConfigs(@category).label

  title2: -> getConfigs(Template.parentData().category).category2Label[@]

  isSelect: (category2)->
    routeCat2 = currentRouteQuery().category2
    if routeCat2
      routeCat2 == category2 and 'selected' or ''
    else
      category2 == getConfigs(Template.parentData().category).category2.official and 'selected' or ''

  category2s: ->
    if hasCategory2(@category)
      _.values getConfigs(@category).category2

  showCategory2s: -> hasCategory2(@category) and not @user and not @favoritesby

  hasMore: ->
    selector = getSelector @
    return Counts.get(getCountName selector) > getListLimit(selector).get()

Template.ionNavBar.events

  'click [data-action=back-to-main]': ()-> back()

  'click [data-action=my-data]': (event, template)->
    if myId()
      Router.go "/profile?type=main&user=#{myId()}"
    else
      Router.go '/signIn?from=list'

Template.postList.events
  'click .category2': -> Router.go "/post/list?category=#{Template.parentData().category}&category2=#{@}", {}, {replaceState: true}

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
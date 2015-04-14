Template.tabBar.helpers
  tabsData: ->
    data = [
      getTabData(PostCategory.note, @user)
      getTabData(PostCategory.journey, @user)
      getTabData(PostCategory.product, @user)
      getTabData(PostCategory.say, @user)
    ]
    if @user
      profile =
        title: userPrefix(@user) + '名片'
        category: 'profile'
        icon: 'card'
        class: "tab-item-light"
        user: @user
      data.splice(2, 0, profile)
    else
      dummy =
        title: ''
        class: "dummy"
      data.splice(2, 0, dummy)

#    renderTabs()
    return data

Template.ionTab.events
  'click': (event, template)->
    data = template.data
    if not data.category
      return
    path = ''
    if data.category is 'profile'
      path = "/profile?type=main&user=#{data.user}"
      Router.go path
    else
      path = "/post/list?category=#{data.category}" + (data.user && "&user=#{data.user}" or '')
      Router.go path, {}, {replaceState: true}
    Session.set('ionTab.current', path);

getTabData = (category, user)->
  configs = getConfigs(category)
  return {
    title: userPrefix(user) + configs.label
    category: category
    icon: configs.icon
    class: "tab-item-light"
    user: user
  }

renderTabs = ->
  @$('.tabs').children().each ->
    href = $(@).attr 'href'
    current = Router.current().location.get().path
    # TODO 弱约束,有待思考
    if s.contains(current, href) or s.contains(href, current)
      Session.set SessionKeys.currentTab, href
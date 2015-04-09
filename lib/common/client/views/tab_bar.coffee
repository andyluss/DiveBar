Template.tabBar.helpers
  tabsData: ->
    prefix = ''
    data = [
      getTabData(PostCategory.note, @user)
      getTabData(PostCategory.journey, @user)
      getTabData(PostCategory.product, @user)
      getTabData(PostCategory.say, @user)
    ]
    if @user
      path = "/profile?type=main&user=#{@user}"
      profile =
        title: userPrefix(@user) + '名片'
        href: path
        path: path
        icon: 'card'
        class: "tab-item-light"
      data.splice(2, 0, profile)
    else
      dummy =
        title: ''
        class: "dummy"
      data.splice(2, 0, dummy)

    renderTabs()
    return data

getTabData = (category, user)->
  configs = getConfigs(category)
  path = "/post/list?category=#{category}" + (user? && "&user=#{user}" or '')
  return {
    title: userPrefix(user) + configs.label
    href: path
    path: path
    icon: configs.icon
    class: "tab-item-light"
  }

renderTabs = ->
  @$('.tabs').children().each ->
    href = $(@).attr 'href'
    current = Router.current().location.get().path
    # TODO 弱约束,有待思考
    if s.contains(current, href) or s.contains(href, current)
      Session.set SessionKeys.currentTab, href
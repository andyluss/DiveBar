Template.tabBar.helpers
  tabsData: ->
    data = [
      getTabData(PostCategory.note, @user)
      getTabData(PostCategory.journey, @user)
      getTabData(PostCategory.product, @user)
      getTabData(PostCategory.say, @user)
    ]
    if @user
      path = "/profile?type=main&user=#{@user}"
      profile =
        title: '名片'
        href: path
        path: path
        iconOff: 'happy-outline'
        iconOn: 'happy'
        class: "tab-item-positive"
      data.splice(2, 0, profile)
    return data

getTabData = (category, user)->
  configs = getConfigs(category)
  path = "/post/list?category=#{category}" + (user? && "&user=#{user}" or '')
  return {
    title: configs.label
    href: path
    path: path
    iconOff: configs.iconOff
    iconOn: configs.iconOn
    class: "tab-item-positive"
  }

Template.tabBar.onRendered ->
  @$('.tabs').children().each ->
    href = $(@).attr 'href'
    current = Router.current().location.get().path
    # TODO 弱约束,有待思考
    if s.contains current, href
      Session.set SessionKeys.currentTab, href
Template.tabBar.helpers
  tabsData: ->
    data = [
      getTabData(PostCategory.note, @user)
      getTabData(PostCategory.journey, @user)
      getTabData(PostCategory.product, @user)
      getTabData(PostCategory.say, @user)
    ]
    console.log(Session.get SessionKeys.currentTab)
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
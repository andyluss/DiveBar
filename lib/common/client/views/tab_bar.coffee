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
        title: '名片'
        href: "/profile?type=main&user=#{@user}"
        path: "profile.main"
        iconOff: 'happy-outline'
        iconOn: 'happy'
        class: "tab-item-positive"
      data.splice(2, 0, profile)
    return data

getTabData = (category, user)->
  configs = getConfigs(category)
  return {
    title: configs.label
    href: "/post/list?category=#{category}" + (user? && "&user=#{user}" or '')
    path: "#{category}.list"
    iconOff: configs.iconOff
    iconOn: configs.iconOn
    class: "tab-item-positive"
  }
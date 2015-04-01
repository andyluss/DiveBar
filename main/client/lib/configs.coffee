@defaultAvatarUrl = '/images/default_avatar.png'


@loadingMore = new ReactiveVar(false)

@AppConfig =
  appName: 'Dive Bar'

@SessionKeys =
  currentTab: 'ionTab.current'

#@SessionKeys =
#  journeyCategory: 'journeyCategory'


Template.registerHelper 'strNote', -> '游记'
Template.registerHelper 'strJourney', -> '行程'
Template.registerHelper 'strProduct', -> '商城'
Template.registerHelper 'strSay', -> '说说'

Template.registerHelper 'strProfile', -> '用户名片'

Template.registerHelper 'strUserNote', -> '用户游记'
Template.registerHelper 'strUserJourney', -> '用户行程'
Template.registerHelper 'strUserProduct', -> '用户商品'
Template.registerHelper 'strUserSay', -> '用户说说'


@defaultAvatarUrl = '/images/default_avatar.png'

@Vars =
  topNotesLimit: new ReactiveVar(10)
  topMyNotesLimit: new ReactiveVar(10)

  topJourneysOfficialLimit: new ReactiveVar(10)
  topJourneysUserLimit: new ReactiveVar(10)
  topMyJourneysOfficialLimit: new ReactiveVar(10)
  topMyJourneysUserLimit: new ReactiveVar(10)

  loadingMore: new ReactiveVar(false)

@AppConfig =
  appName: 'Dive Bar'

@SessionKeys =
  preRoute: 'preRoute'
  currentTab: 'ionTab.current'



#@SessionKeys =
#  journeyCategory: 'journeyCategory'


Template.registerHelper 'strNote', -> '游记'
Template.registerHelper 'strJourney', -> '行程'
Template.registerHelper 'strProduct', -> '商城'
Template.registerHelper 'strSay', -> '说说'

Template.registerHelper 'strMyCard', -> '我的名片'

Template.registerHelper 'strMyNote', -> '我的游记'
Template.registerHelper 'strMyJourney', -> '我的行程'
Template.registerHelper 'strMyProduct', -> '我的商品'
Template.registerHelper 'strMySay', -> '我的说说'

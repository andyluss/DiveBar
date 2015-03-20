@defaultAvatarUrl = '/images/default_avatar.png'

@Vars =
  notesTopLimit: new ReactiveVar(10)
  myNotesTopLimit: new ReactiveVar(10)
  loadingMoreNotes: new ReactiveVar(false)

@SessionKeys =
  preRoute: 'preRoute'
  currentTab: 'ionTab.current'

#Strings:

#@JourneyCategory =
#  official: 'official'
#  user: 'user'

@JourneyTitle =
  official: '官方行程'
  user: '潜友行程'


#@SessionKeys =
#  journeyCategory: 'journeyCategory'

Template.registerHelper 'strNote', -> '游记'
Template.registerHelper 'strJourney', -> '行程'
Template.registerHelper 'strProduct', -> '商城'
Template.registerHelper 'strSay', -> '七嘴八舌'
Template.registerHelper 'strMyCard', -> '我的名片'
Template.registerHelper 'strMyNote', -> '我的游记'
Template.registerHelper 'strMyJourney', -> '我的行程'
Template.registerHelper 'strMyProduct', -> '我的商品'
Template.registerHelper 'strMySay', -> '我的说说'


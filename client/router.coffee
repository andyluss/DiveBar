@subManager = new SubsManager()

Router.configure
  layoutTemplate: 'layoutContent'

Router.route '/', ->
  if Meteor.userId()
    @redirect '/note/list'
  else
    @redirect '/login'

# Login

Router.route '/login',
  name: 'login'

Router.plugin('ensureSignedIn', {
  only: ['my.card', 'my.note.list', 'note.creator']
});

AccountsTemplates.configureRoute 'ensureSignedIn',
  template: 'ensureLogin'
  layoutTemplate: 'layoutContent'

# My Card

Router.route '/my/card'
Router.route '/my/card/nickname',
  data: -> Profiles.findOne {owner: Meteor.userId()}
Router.route '/my/card/qq',
  data: -> Profiles.findOne {owner: Meteor.userId()}
Router.route '/my/card/wechat',
  data: -> Profiles.findOne {owner: Meteor.userId()}
Router.route '/my/card/mobile',
  data: -> Profiles.findOne {owner: Meteor.userId()}
Router.route '/my/card/signature',
  data: -> Profiles.findOne {owner: Meteor.userId()}



Router.route '/my/note/list',
  name: 'my.note.list'


# Note

Router.route '/note/list',
  name: 'note.list'

Router.route '/note/creator',
  name: 'note.creator'

Router.route '/note/updater/:id',
  name: 'note.updater'
  data: ->
    Notes.findOne({_id: @params.id})

Router.route '/note/detail/:id',
  name: 'note.detail'





Router.route '/my/journey/list',
  name: 'my.journey/list'

Router.route '/my/product/list',
  name: 'my.product/list'

Router.route '/my/say/list',
  name: 'my.say/list'

Router.route '/user/:id',
  name: 'user.detail'

Router.route '/journey/list',
  name: 'journey.list'

Router.route '/journey/detail/:id',
  name: 'journey.detail'

Router.route '/product/list'

Router.route '/say/list'

Router.configure
  layoutTemplate: 'layout'

#Router.route 'tab/:type', ->
#  tabPath = Session.get('path_tab_' + @params.type) ? @params.type

Router.route '/', ->
  @redirect 'note'

Router.route 'user/:id',
  name: 'user.detail'

Router.route 'note',
  name: 'note'

Router.route 'note/:id',
  name: 'note.detail'

Router.route 'journey'

Router.route 'shop'

Router.route 'say'

Router.onBeforeAction AccountsTemplates.ensureSignedIn,
  only: ['say']

AccountsTemplates.configureRoute 'ensureSignedIn',
  template: 'signIn'
  layoutTemplate: 'layout'
@subManager = new SubsManager()

Router.route '/', ->
  if Meteor.userId()
    @redirect '/note/list'
  else
    @redirect '/login'

Router.route '/login'

Router.route '/user/:id',
  name: 'user.detail'

Router.route '/note/list',
  name: 'note.list'

Router.route '/note/creator',
  name: 'note.creator'
  layoutTemplate: 'layoutContent'

Router.route '/note/updater/:id',
  name: 'note.updater'
  layoutTemplate: 'layoutContent'
  data: ->
    Notes.findOne({_id: @params.id})

Router.route '/note/detail/:id',
  name: 'note.detail'

Router.route '/journey/list',
  name: 'journey.list'

Router.route '/journey/detail/:id',
  name: 'journey.detail'

Router.route '/product/list'

Router.route '/say/list'

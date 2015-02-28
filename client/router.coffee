Router.route '/', ->
  if Meteor.userId()
    @redirect 'note_list'
  else
    @redirect 'login'

Router.route 'login'

Router.route 'user/:id',
  name: 'user.detail'

Router.route 'note_list'

Router.route 'note_detail/:id',
  name: 'note.detail'

Router.route 'journey'

Router.route 'shop'

Router.route 'say'

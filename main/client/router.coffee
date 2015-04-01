
Router.route '/', ->
  if Meteor.userId()
    @redirect '/post/list?category=note'
  else
    @redirect '/login'





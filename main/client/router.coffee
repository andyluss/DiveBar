
Router.route '/', ->
  if myId()
    @redirect '/post/list?category=note'
  else
    @redirect '/login'





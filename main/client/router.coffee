Router.route '/', ->
  if myId()
    @redirect '/post/list?category=note'
  else
    @redirect '/login'


Router.configure
  progressDelay: 300
  progressTick: false
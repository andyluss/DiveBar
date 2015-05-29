Router.route '/', ->
  if myId()
    @redirect '/post/list?category=note'
  else
    @redirect '/signIn'

Router.configure
  progressDelay: 300
  progressTick: false
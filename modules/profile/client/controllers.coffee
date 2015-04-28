@ProfileController = ContentController.extend
  action: -> @render "profile#{cap(paramsQuery(@).type or 'main')}"
  waitOn: ->
    subManager.subscribe 'user', paramsQuery(@).user or myId()
    subManager.subscribe 'profile', paramsQuery(@).user or myId()
    subscribeMyFavorites()
  data: -> noTransition Profiles.findOne({user: paramsQuery(@).user or myId()})
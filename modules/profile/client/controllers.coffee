@ProfileController = ContentController.extend
  action: -> @render "profile#{cap(paramsQuery(@).type or 'main')}"
  waitOn: ->
    subsManager.subscribe 'user', paramsQuery(@).user or myId()
    subsManager.subscribe 'profile', paramsQuery(@).user or myId()
    subscribeMyFavorites()
  data: -> Profiles.findOne({user: paramsQuery(@).user or myId()})
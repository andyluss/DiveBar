@ProfileController = ContentController.extend
  action: -> @render "profile#{cap(pq(@).type or 'main')}"
  waitOn: ->
    subManager.subscribe 'user', pq(@).user or myId()
    subManager.subscribe 'profile', pq(@).user or myId()
    subManager.subscribe 'favoritesByUser', myId()
  data: -> Profiles.findOne {user: pq(@).user or myId()}
@ProfileController = ContentController.extend
  action: -> @render "profile#{cap pq(@).type}"
  onAfterAction: -> subManager.subscribe 'profile', pq(@).user
  data: -> Profiles.findOne {user: pq(@).user}
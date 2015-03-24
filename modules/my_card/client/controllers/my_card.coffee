@MyCardController = ContentController.extend
  onAfterAction: ->
    subManager.subscribe 'myUserData'
    subManager.subscribe 'profileByOwner', Meteor.userId()
  data: -> Profiles.findOne {owner: Meteor.userId()}
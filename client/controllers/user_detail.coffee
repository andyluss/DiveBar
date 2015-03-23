@UserDetailController = ContentController.extend
  onAfterAction: ->
    subManager.subscribe 'user', @params.id
  data: ->
    Meteor.users.findOne {_id: @params.id}
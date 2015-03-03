@UserDetailController = ContentController.extend
  waitOn: ->
    Meteor.subscribe 'user', @params.id
  data: ->
    Meteor.users.findOne({_id: @params.id})
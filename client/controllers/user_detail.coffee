@UserDetailController = BaseController.extend
  waitOn: ->
    Meteor.subscribe 'user', @params.id
  data: ->
    user: Meteor.users.findOne({_id: @params.id})
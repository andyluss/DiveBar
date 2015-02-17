@NoteDetailController = BaseController.extend
  waitOn: ->
    Meteor.subscribe 'note', @params.id
  data: ->
    Notes.findOne({_id: @params.id})
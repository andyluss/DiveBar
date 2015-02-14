@NoteDetailController = BaseController.extend
  waitOn: ->
    Meteor.subscribe 'note', @params.id
  data: ->
    note: Notes.findOne({_id: @params.id})
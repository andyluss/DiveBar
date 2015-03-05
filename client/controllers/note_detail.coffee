@NoteDetailController = ContentController.extend
  waitOn: ->
    subManager.subscribe 'note', @params.id
  data: ->
    Notes.findOne({_id: @params.id})
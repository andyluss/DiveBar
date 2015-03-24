@NoteDetailController = ContentController.extend
  onAfterAction: ->
    subManager.subscribe 'note', @params.id
    subManager.subscribe 'favoritesByUser', Meteor.userId()
  data: ->
    Notes.findOne({_id: @params.id})
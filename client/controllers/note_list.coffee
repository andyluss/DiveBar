@NoteListController = ContentController.extend
  onAfterAction: ->
    Meteor.subscribe 'notesTop', Vars.notesTopLimit.get()
    Meteor.subscribe 'favoritesByUser', Meteor.userId
  data: ->
    list: Notes.find {}, {sort: {date: -1}}
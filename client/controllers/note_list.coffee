@NoteListController = ContentController.extend
  waitOn: ->
    subManager.subscribe 'notesTop'
    subManager.subscribe 'favoritesByUser', Meteor.userId
  data: ->
    list: Notes.find {}, {sort: {date: -1}}
@NoteListController = ContentController.extend
  waitOn: ->
    Meteor.subscribe 'notesTop'
  data: ->
    {
      notes: Notes.find {}, {sort: {date: -1}}
    }
@NoteListController = ContentController.extend
  waitOn: ->
    Meteor.subscribe 'notesTop'
  data: ->
    {
      list: Notes.find {}, {sort: {date: -1}}
    }
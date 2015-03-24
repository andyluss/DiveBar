@NoteListController = ContentController.extend
  onAfterAction: ->
    subManager.subscribe 'notesTop', Vars.notesTopLimit.get(), -> Vars.loadingMoreNotes.set false
  data: ->
    list: Notes.find {}, {sort: {date: -1}}
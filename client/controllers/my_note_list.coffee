@MyNoteListController = ContentController.extend
  onAfterAction: ->
    subManager.subscribe 'notesTop', Vars.myNotesTopLimit.get(), Meteor.userId(), -> Vars.loadingMoreNotes.set false
  data: ->
    list: Notes.find {owner: Meteor.userId()}, {sort: {date: -1}}
    owner: Meteor.userId()
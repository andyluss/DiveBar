noteCount = new ReactiveVar(0)

Template.noteList.rendered = ->
  Session.set 'ionTab.current', 'note.list'

  Meteor.call 'noteCount', (error, result)->
    noteCount.set result if result?

  template = this
  @autorun ->
    if Vars.loadingMoreNotes.get()
      template.$('.loadmore-button').addClass('loading').html('加载中')
    else
      template.$('.loadmore-button').removeClass('loading').html('点击加载更多')

Template.noteList.helpers
  hasMore: ->
    return noteCount.get() > Vars.notesTopLimit.get()

Template.noteList.events
  'click .loadmore-button': (event, template)->
    Vars.loadingMoreNotes.set true
    Vars.notesTopLimit.set Vars.notesTopLimit.get() + 10
noteCount = new ReactiveVar(0)

Template.noteLoader.rendered = ->

  Meteor.call 'noteCount', @data.owner, (error, result)->
    noteCount.set result if result?

  template = this
  @autorun ->
    if Vars.loadingMoreNotes.get()
      template.$('.loadmore-button').addClass('loading').html('加载中')
    else
      template.$('.loadmore-button').removeClass('loading').html('点击加载更多')

Template.noteLoader.helpers
  hasMore: ->
    return noteCount.get() > Vars.notesTopLimit.get()

Template.noteLoader.events
  'click .loadmore-button': (event, template)->
    Vars.loadingMoreNotes.set true
    Vars.notesTopLimit.set Vars.notesTopLimit.get() + 10
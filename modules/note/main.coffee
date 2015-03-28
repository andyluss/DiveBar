createPostBase PostCategory.note

if Meteor.isClient
  Template.noteList.rendered = ->
    Session.set SessionKeys.currentTab, 'note.list'

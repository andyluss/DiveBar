
Meteor.methods
  noteCount: ->
    Notes.find().count()
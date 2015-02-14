@Notes = new Meteor.Collection('notes');

Notes.attachSchema new SimpleSchema

  owner:
    type: String
    regEx: SimpleSchema.RegEx.Id
    autoValue: ->
      if this.isInsert
        Meteor.userId()
    autoform:
      options: ->
        _.map Meteor.users.find().fetch(), (user)->
          label: user.emails[0].address
          value: user._id

  createdAt:
    type: Date
    autoValue: ->
      if this.isInsert
        new Date()

  updatedAt:
    type: Date
    optional:true
    autoValue: ->
      if this.isUpdate
        new Date()

  title:
    type: String
    max: 100

  content:
    type: String
    max: 1000
    autoform:
      rows: 10

  date:
    type: Date
    autoValue: ->
      if this.isInsert
        new Date()

  pictures:
    type: [String]


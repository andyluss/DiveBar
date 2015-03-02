@Notes = new Meteor.Collection('notes');

Notes.attachSchema new SimpleSchema

  owner:
    type: String
    label: '作者'
    regEx: SimpleSchema.RegEx.Id
    autoValue: ->
      if @isInsert
        Meteor.userId()
    autoform:
      options: ->
        _.map Meteor.users.find().fetch(), (user)->
          label: user.emails[0].address
          value: user._id

  createdAt:
    type: Date
    autoValue: ->
      if @isInsert
        new Date()

  updatedAt:
    type: Date
    optional:true
    autoValue: ->
      if @isUpdate
        new Date()

  title:
    type: String
    label: '标题'
    max: 100

  content:
    type: String
    label: '内容'
    max: 1000
    autoform:
      rows: 10

  date:
    type: Date
    label: '日期'
    autoValue: ->
      if @isInsert
        new Date()

  pictures:
    label: '图片'
    type: [String]


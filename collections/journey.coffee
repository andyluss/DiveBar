@Journeys = new Meteor.Collection('journeys');

Journeys.attachSchema new SimpleSchema

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

  category:
    type: String
    label: '类型'
    autoform:
      options: [
        {
          label: '官方'
          value: 'official'
        },
        {
          label: '用户'
          value: 'user'
        }
      ]

  title:
    type: String
    label: '标题'
    max: 100

  location:
    type: String
    label: '地点'
    defaultValue: '待定'
    max: 100

  cost:
    type: Number
    label: '花费'
    defaultValue: 100
    min: 0

  level:
    type: Number
    label: '级别'
    defaultValue: 1
    min: 0

  peopleCount:
    type: Number
    label: '人数'
    defaultValue: 0
    min: 0

  peopleCountMax:
    type: Number
    label: '最大人数'
    defaultValue: 1
    min: 0

  content:
    type: String
    label: '内容'
    max: 1000
    optional: true
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
    optional:true


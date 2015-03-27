createPostBase PostCategory.journey, true

Journeys.attachSchema new SimpleSchema

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
    defaultValue: 10
    min: 0

if Meteor.isClient

  Template.journeyList.onCreated ->
    @data.lists[0].itemTemplate = 'imageItem'
    @data.lists[1].itemTemplate = 'userJourneyItem'

  Template.myJourneyList.onCreated ->
    @data.itemTemplate = 'userJourneyItem'

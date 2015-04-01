createPostBase PostCategory.journey, true

Journeys.attachSchema new SimpleSchema

  location:
    type: String
    label: '地点'
    optional: true
    max: 100
    autoform:
      placeholder: '地点...'

  cost:
    type: Number
    label: '花费'
    optional: true
    defaultValue: 100
    min: 0

  level:
    type: Number
    label: '级别'
    optional: true
    defaultValue: 1
    min: 0

  peopleCount:
    type: Number
    label: '人数'
    optional: true
    defaultValue: 0
    min: 0

  peopleCountMax:
    type: Number
    label: '最大人数'
    optional: true
    defaultValue: 10
    min: 0


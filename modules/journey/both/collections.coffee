@Journeys = new Meteor.Collection(plural PostCategory.journey);

Journeys.attachSchema new SimpleSchema [PostSchema, {

  category:
    type: String
    label: '分类'
    defaultValue: PostCategory.journey

  category2:
    type: String
    label: '分类2'
    autoform:
      options: [
        {
          label: '官方'
          value: JourneyCategory2.official
        },
        {
          label: '用户'
          value: JourneyCategory2.user
        }
      ]

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

}
]

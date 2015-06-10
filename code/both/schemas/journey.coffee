
@initJourneySchema = ->

  category = PostCategory.journey
  category2 = getConfigs(category).category2
  category2Label = getConfigs(category).category2Label

  options = []
  _.each category2, (value)->
    options.push
      value: category2[value]
      label: category2Label[value]

  moreSchema =

    category2:
      type: String
      label: '子分类'
      defaultValue: category2.official
      autoform:
        options: options

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

    date:
      type: Date
      label: '日期'
      optional: true
      autoValue: ->
        if @isInsert
          new Date()

    peopleCount:
      type: Number
      label: '人数'
      optional: true
      defaultValue: 0
      min: 0

  Schemas.journey = new SimpleSchema [Schemas.post, moreSchema]
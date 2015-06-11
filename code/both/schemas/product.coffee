
@initProductSchema = ->

  category = PostCategory.product
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

    price:
      type: Number
      label: '价格（元）'
      defaultValue: 100
      min: 0
      optional: true

    old:
      type: String
      label: '新旧'
      optional: true
      autoform:
        placeholder: '新旧...'

  Schemas.product = new SimpleSchema [Schemas.post, moreSchema]
createPostBase PostCategory.product, true

Products.attachSchema new SimpleSchema

  price:
    type: Number
    label: '价格（元）'
    defaultValue: 100
    min: 0
    optional: true

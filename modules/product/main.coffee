createPostBase PostCategory.product, true

Products.attachSchema new SimpleSchema

  price:
    type: Number
    label: '价格'
    defaultValue: 100
    min: 0

  viewCount:
    type: Number
    label: '阅读数'

if Meteor.isClient
  Template.productList.onCreated ->
    @data.lists[0].itemTemplate = 'imageItem'
    @data.lists[1].itemTemplate = 'userProductItem'
  Template.myProductList.onCreated ->
    @data.itemTemplate = 'userProductItem'

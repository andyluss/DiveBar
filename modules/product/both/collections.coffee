@Products = new Meteor.Collection(plural PostCategory.product);

Products.attachSchema new SimpleSchema [PostSchema, {

  category:
    type: String
    label: '分类'
    defaultValue: PostCategory.product

  category2:
    type: String
    label: '分类2'
    defaultValue: ProductCategory2.user
    autoform:
      options: [
        {
          label: '官方'
          value: ProductCategory2.official
        },
        {
          label: '用户'
          value: ProductCategory2.user
        }
      ]

  price:
    type: Number
    label: '价格'
    defaultValue: 100
    min: 0

}
]

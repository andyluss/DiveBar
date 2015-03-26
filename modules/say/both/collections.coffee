@Says = new Meteor.Collection plural PostCategory.say

Says.attachSchema new SimpleSchema [PostSchema, {

  category:
    type: String
    label: '分类'
    defaultValue: PostCategory.say

}
]
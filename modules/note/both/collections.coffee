@Notes = new Meteor.Collection plural PostCategory.note

Notes.attachSchema new SimpleSchema [PostSchema, {

  category:
    type: String
    label: '分类'
    defaultValue: PostCategory.note

}
]
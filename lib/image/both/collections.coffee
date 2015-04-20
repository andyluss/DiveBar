@Images = new Meteor.Collection 'images'

Images.attachSchema new SimpleSchema

  user:
    type: String
    label: '用户'
    regEx: SimpleSchema.RegEx.Id

  creator:
    type: String
    label: '创建标记'

  key:
    type: String
    label: '文件键'

  uploaded:
    type: Boolean
    label: '是否已上传'
    defaultValue: false
    optional: true

  width:
    type: Number
    label: '宽'
    optional: true

  height:
    type: Number
    label: '高'
    optional: true

@Images = new Meteor.Collection 'images'

Images.attachSchema new SimpleSchema
  creator:
    type: String
    label: '创建标记'
  key:
    type: String
    label: '文件键'
  width:
    type: Number
    label: '宽'
    optional: true
  height:
    type: Number
    label: '高'
    optional: true
  base64:
    type: String
    label: 'Base64编码'
    optional: true
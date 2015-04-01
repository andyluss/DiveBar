@Profiles = new Meteor.Collection('profiles');

Profiles.attachSchema new SimpleSchema

  user:
    type: String
    label: '用户'
    regEx: SimpleSchema.RegEx.Id

  picture:
    type: String
    optional:true
    label: '照片'
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'ProfilePictures'

  avatar:
    type: String
    optional:true
    label: '头像'

  nickname:
    type: String
    label: '昵称'
    max: 10
    optional: true

  location:
    type: String
    label: '地址'
    max: 20
    optional: true

  qq:
    type: String
    label: 'QQ'
    max: 50
    optional: true

  wechat:
    type: String
    label: '微信'
    max: 50
    optional: true

  mobile:
    type: String
    label: '手机'
    regEx: /^[0-9]{5,20}$/
    max: 20
    optional: true

  signature:
    type: String
    label: '签名'
    max: 100
    optional: true
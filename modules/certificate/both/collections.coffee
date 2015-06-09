@CertificateSchema = new SimpleSchema

  user:
    type: String
    label: '作者'
    regEx: SimpleSchema.RegEx.Id
    autoValue: ->
      if @isInsert
        myId()
    autoform:
      options: ->
        _.map Users.find().fetch(), (user)->
          label: user.emails[0].address
          value: user._id

  createdAt:
    type: Date
    autoValue: ->
      if @isInsert
        new Date()

  updatedAt:
    type: Date
    optional:true
    autoValue: ->
      if @isUpdate
        new Date()

  realName:
    type: String
    label: '真实姓名'
    max: 20
    optional: true
    autoform:
      placeholder: '真实姓名...'

  orgName:
    type: String
    label: '组织名称'
    max: 20
    optional: true
    autoform:
      placeholder: '组织名称...'

  level:
    type: String
    label: '证书等级'
    max: 20
    optional: true
    autoform:
      placeholder: '证书等级...'

  num:
    type: String
    label: '证书编号'
    max: 100
    optional: true
    autoform:
      placeholder: '证书编号...'

  date:
    type: Date
    label: '颁证时间'
    optional: true

  desc:
    type: String
    label: '证书说明'
    max: 100
    optional: true
    autoform:
      placeholder: '证书说明...'

  images:
    type: [String]
    label: '图片集（七牛云图片key）'
    optional: true
    defaultValue: []

@Certificates = new Meteor.Collection 'certificates'
Certificates.attachSchema CertificateSchema
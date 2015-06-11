
Meteor.startup ->
  initSchemas()
  initQiniu()
  initT9n()
  initEasySearch()

initSchemas = ->
  initPostSchema()
  initNoteSchema()
  initJourneySchema()
  initProductSchema()
  initSaySchema()
  initCertificateSchema()

initQiniu = ->
  qiniuConfig.BUCKET = 'divebar'
  qiniuConfig.DOMAIN = 'http://7xicv5.com1.z0.glb.clouddn.com/'

initT9n = ->
  T9n.setLanguage 'zh-cn'
  T9n.map "zh-cn",
    "Email": "电子邮箱"
    "Required Field": "需要填写"
    "Invalid email": "无效的电子邮箱"
    "Minimum required length: 6": "最小需要长度：6"
    "Login forbidden": "邮箱或密码错误"
    "Send again": "重发验证邮件"
    "Send email again": "重发验证邮件"
    "emailResetLink": "发送重置邮件"

initEasySearch = ->
  EasySearch.createSearchIndex 'Posts',
    field: ['title']
    returnFields: ['title', '_id', 'category']
    collection: Posts
    limit: 20
    use: 'mongo-db'
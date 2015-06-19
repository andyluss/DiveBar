Meteor.startup ->

  initHouston()
  initEmailTemplates()
  initQiniu()
  initAccounts()
  initRootUser()

initHouston = ->
  Houston.add_collection Users
  Houston.add_collection Houston._admins

  global['Favorites'] and Houston.add_collection Favorites
  global['Comments'] and Houston.add_collection Comments._collection


initEmailTemplates = ->
  Accounts.emailTemplates.siteName = '潜途'
  Accounts.emailTemplates.from = '潜途管理员 <admin@nananono.com>'
  Accounts.emailTemplates.verifyEmail.subject = (user)-> "欢迎来到潜途"
  Accounts.emailTemplates.verifyEmail.text = (user, url)-> "欢迎来到潜途，请点击下面的链接验证邮箱：\n\n" + url
  Accounts.emailTemplates.resetPassword.subject = (user)-> "潜途密码重设"
  Accounts.emailTemplates.resetPassword.text = (user, url)-> "请点击下面的链接重设密码：\n\n" + url

initQiniu = ->
  qiniuServer.conf.ACCESS_KEY = 'LcRTt-2Z86c0YA2p3hCwFGyWndeOUASw3hchqxBw'
  qiniuServer.conf.SECRET_KEY = 'qogmM2NaFyQNp24VqBrm1NkN_990H-aTgLSjj30t'

initAccounts = ->
  Accounts.onCreateUser (options, user)->
    user.profileId = Profiles.insert {user: user._id}
    return user

initRootUser = ->
  # Create root admin
  if Users.find().count() == 0
    userId = Accounts.createUser
      email: 'root@divebar.com'
      password: 'test1234'
      username: 'root'
    Roles.addUsersToRoles userId, UserRoles.admin


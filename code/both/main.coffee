AccountsTemplates.configure
  overrideLoginErrors: false
  sendVerificationEmail: true
  enablePasswordChange: true
  showForgotPasswordLink: true

if Meteor.isServer

  Accounts.emailTemplates.siteName = '潜途'
  Accounts.emailTemplates.from = '潜途管理员 <admin@nananono.com>'
  Accounts.emailTemplates.verifyEmail.subject = (user)-> "欢迎来到潜途"
  Accounts.emailTemplates.verifyEmail.text = (user, url)-> "欢迎来到潜途，请点击下面的链接验证邮箱：\n\n" + url
  Accounts.emailTemplates.resetPassword.subject = (user)-> "潜途密码重设"
  Accounts.emailTemplates.resetPassword.text = (user, url)-> "请点击下面的链接重设密码：\n\n" + url


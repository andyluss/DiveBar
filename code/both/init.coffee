init = ->
  initAccounts()
  initT9n()

initAccounts = ->
  AccountsTemplates.configure
    overrideLoginErrors: false
    sendVerificationEmail: true
    enablePasswordChange: true
    showForgotPasswordLink: true
    preSignUpHook: ->
      IonLoading and IonLoading.show({customTemplate: '<i class="icon ion-load-a"></i>'})

  configAccountsTemplatesRoute()
  Accounts.onLogin -> IonLoading and IonLoading.hide()

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


init()
@configAccountsTemplatesRoute = ->

  AccountsTemplates.configureRoute 'signIn',
    name: 'signIn'
    path: '/signIn'
    template: 'signIn'
    layoutTemplate: 'layoutContent'
    redirect: '/'

  AccountsTemplates.configureRoute 'signUp',
    name: 'signUp'
    path: '/signUp'
    template: 'signUp'
    layoutTemplate: 'layoutContent'

  AccountsTemplates.configureRoute 'forgotPwd',
    name: 'forgotPwd'
    path: '/forgotPwd'
    template: 'forgotPwd'
    layoutTemplate: 'layoutContent'

  AccountsTemplates.configureRoute 'changePwd',
    name: 'changePwd'
    path: '/changePwd'
    template: 'changePwd'
    layoutTemplate: 'layoutContent'
    redirect: '/'

  AccountsTemplates.configureRoute 'verifyEmail',
    name: 'verifyEmail'
    path: '/verifyEmail'
    template: 'verifyEmail'
    layoutTemplate: 'layoutContent'

  AccountsTemplates.configureRoute 'resendVerificationEmail',
    name: 'resendVerificationEmail'
    path: '/resendVerificationEmail'
    template: 'resendVerificationEmail'
    layoutTemplate: 'layoutContent'

  AccountsTemplates.configureRoute 'ensureSignedIn',
    template: 'signIn'
    layoutTemplate: 'layoutContent'

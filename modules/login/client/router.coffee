Router.route '/login',
  name: 'login'

AccountsTemplates.configureRoute 'ensureSignedIn',
  template: 'login'
  layoutTemplate: 'layoutContent'

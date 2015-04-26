Router.route '/login'

AccountsTemplates.configureRoute 'ensureSignedIn',
  template: 'login'
  layoutTemplate: 'layoutContent'

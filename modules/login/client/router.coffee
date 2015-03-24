Router.route '/login',
  name: 'login'

Router.plugin('ensureSignedIn', {
  only: ['my.card', 'my.note.list', 'note.creator']
});

AccountsTemplates.configureRoute 'ensureSignedIn',
  template: 'login'
  layoutTemplate: 'layoutContent'

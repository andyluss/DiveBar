
Router.route '/profile',
  name: 'profile'
  progress : false

Router.plugin('ensureSignedIn', {
  only: ['profile']
});
@subsManager = new SubsManager()

Router.configure
  layoutTemplate: 'layoutContent'

Router.route '/', ->
  if myId()
    @redirect '/post/list?category=note'
  else
    @redirect '/signIn'



Router.route "/certificate/list"

Router.route "/certificate/detail"

Router.route "/certificate/creator"

Router.route "/certificate/updater"


Router.route "/user/list"
Router.route "/user/search"

Router.route "/search"

Router.route '/profile'



Router.route "/post/list"

Router.route "/post/detail"

Router.route "/post/comments"

Router.route "/post/creator"

Router.route "/post/updater"

Router.plugin('ensureSignedIn', {
  only: ["post.creator", "post.updater", "certificate.creator", "certificate.updater"]
});



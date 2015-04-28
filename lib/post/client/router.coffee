
Router.route "/post/list"

Router.route "/post/detail"

Router.route "/post/creator"

Router.route "/post/updater"

Router.route "/post/search"

Router.plugin('ensureSignedIn', {
  only: ["post.creator", "post.updater"]
});
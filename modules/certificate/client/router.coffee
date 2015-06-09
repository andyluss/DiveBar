Router.route "/certificate/list"

Router.route "/certificate/detail"

Router.route "/certificate/creator"

Router.route "/certificate/updater"

Router.plugin('ensureSignedIn', {
  only: ["certificate.creator", "certificate.updater"]
});
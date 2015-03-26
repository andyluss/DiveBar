@createPostRouter = (name)->

  Router.route "/#{name}/list",
    name: "#{name}.list"

  Router.route "/#{name}/creator",
    name: "#{name}.creator"

  Router.route "/#{name}/updater/:id",
    name: "#{name}.updater"

  Router.route "/#{name}/detail/:id",
    name: "#{name}.detail"

  Router.route "/my/#{name}/list",
    name: "my.#{name}.list"

  Router.plugin('ensureSignedIn', {
    only: ["my.#{name}.list", "#{name}.creator"]
  });
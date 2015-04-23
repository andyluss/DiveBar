@createPostBase = (category, hasCategory2)->

  createPostCollection category, hasCategory2

  if Meteor.isServer
    createPostPermission category

  if Meteor.isClient
    window['createPostViews'] and (createPostViews category)
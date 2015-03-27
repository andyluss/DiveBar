@createPostBase = (category, hasCategory2)->

  createPostCollection category, hasCategory2
  createPostCountMethod category

  if Meteor.isServer
    createPostPermission category
    createPostPublications category
  
  if Meteor.isClient
    createPostRouter category
    createPostControllers category, hasCategory2
    createPostViews category
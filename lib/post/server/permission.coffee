@createPostPermission = (name)->
  capName = s.capitalize name
  pluralCapName = plural capName
  global[pluralCapName].allow
    insert: checkOwner
    update: checkOwner
    remove: checkOwner


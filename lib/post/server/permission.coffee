@createPostPermission = (category)->
  coln(category).allow
    insert: checkOwner
    update: checkOwner
    remove: checkOwner


@createPostPermission = (category)->
  coln(category).allow
    insert: checkUser
    update: checkUser
    remove: checkUser


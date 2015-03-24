Notes.allow
  insert: checkOwner
  update: checkOwner
  remove: checkOwner

checkOwner = (userId, doc)->
  userId == doc.owner


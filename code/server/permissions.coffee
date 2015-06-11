baseAllows =
  insert: checkUser
  update: checkUser
  remove: checkUser

setBaseAllows = (cols)-> col.allow baseAllows for col in cols

setBaseAllows [Posts, Certificates, Profiles]

@checkOwner = (userId, doc)->
  userId == doc.owner

@plural = (str)->
  str + 's'


@myId = ->
  Meteor.userId()

@mySelf = ->
  Meteor.user()

@userById = (userId)->
  if userId == myId()
    mySelf()
  else
    Meteor.users.findOne {_id: userId}

@userProfile = (userId)->
  Profiles.findOne({owner: userId})

@imageUrl = (imageId)->
  image = Images.findOne(imageId)
  if image then image.url({store:'images'}) else ''
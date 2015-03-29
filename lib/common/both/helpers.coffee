@gbl = ->
  Meteor.isClient and window or global

@getConfigs = (name)->
  if not gbl()[name + 'Configs']
    gbl()[name + 'Configs'] = {}
  return gbl()[name + 'Configs']

@amIAdmin = ->
  _.contains(Meteor.user().roles, UserRoles.admin)

@checkOwner = (userId, doc)->
  userId == doc.owner or amIAdmin()

@canEdit = (doc)->
  doc.owner == Meteor.userId() or amIAdmin()

@cap = (str)->
  s.capitalize str

@plural = (str)->
  str + 's'

@pcap = (str)->
  plural cap str

@coln = (category)->
  gbl()[pcap category]

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
  image = Images.findOne imageId
  if image then image.url({store:'images'}) else ''
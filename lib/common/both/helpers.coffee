@pq = (context)->
  context.params.query

@gbl = ->
  Meteor.isClient and window or global

@getConfigs = (name)->
  if not gbl()[name + 'Configs']
    gbl()[name + 'Configs'] = {}
  return gbl()[name + 'Configs']

@amIAdmin = ->
  _.contains(Meteor.user().roles, UserRoles.admin)

@checkUser = (userId, doc)->
  userId == doc.user or amIAdmin()

@canEdit = (doc)->
  doc.user == Meteor.userId() or amIAdmin()

@cap = (str)->
  s.capitalize str

@plural = (str)->
  str + 's'

@pcap = (str)->
  plural cap str

@coln = (category)->
  gbl()[pcap category]

@getCountName = (selector)->
  return 'count_' + JSON.stringify selector

@getCommentCountName = (docId)->
  "#{docId}_CommentCount"

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
  Profiles.findOne({user: userId})

@userName = (userId)->
  user = userById userId
  if user
    profile = userProfile userId
    profile and profile.nickname or user.username or user.emails[0].address.split('@')[0]
  else
    '游客'

@imagesByCreator = (creator)->
  Images.find {creator: creator}

@firstImagesByCreator = (creator)->
  Images.findOne {creator: creator}

@imageUrl = (imageIdOrImage, store)->
  if typeof imageIdOrImage is 'string'
    image = Images.findOne {_id: imageIdOrImage}
  else
    image = imageIdOrImage
  return image?.url({store: store or 'images'}) or ''

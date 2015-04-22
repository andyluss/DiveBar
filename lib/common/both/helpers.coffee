@pq = (context)-> context.params.query

@gbl = -> Meteor.isClient and window or global

@getConfigs = (name)->
  if not gbl()[name + 'Configs']
    gbl()[name + 'Configs'] = {}
  return gbl()[name + 'Configs']

@isAdmin = (userId)->
  user = Meteor.users.findOne {_id: userId}
  return user and _.contains(user.roles, UserRoles.admin)

@amIAdmin = -> Meteor.userId() and _.contains(Meteor.user().roles, UserRoles.admin)

@checkUser = (userId, doc)-> (userId == doc.user) or amIAdmin()

@canEdit = (doc)-> (doc.user == myId()) or amIAdmin()

@cap = (str)-> s.capitalize str

@plural = (str)-> str + 's'

@pcap = (str)-> plural cap(str)

@coln = (category)-> gbl()[pcap category]

@getCountName = (selector)-> 'count_' + JSON.stringify selector

@getCommentCountName = (docId)-> "#{docId}_CommentCount"

@myId = -> Meteor.userId()

@isMe = (userId)-> myId() and (userId == myId())

@mySelf = -> Meteor.user()

@userPrefix = (userId, showName, isFavorite)->
  prefix = ''
  if userId
    if isMe userId
      prefix = "我的"
    else
      prefix = showName and (userName(userId) + "的") or "用户"
  if isFavorite
    prefix = '收藏的' + prefix
  return prefix

@idByUser = (user)->
  if _.isObject(userId) and _.has user, '_id'
    return user._id
  else
    return user

@userById = (userId)->
  if _.isObject(userId) and _.has(userId, '_id')
    return userId
  if userId == myId()
    return mySelf()
  else
    return Users.findOne {_id: userId}

@userProfile = (userId)-> Profiles.findOne {user: userId}

@userUrl = (userId)-> "/profile?type=main&user=#{userId}"

@userName = (userId)->
  user = userById userId
  if user
    profile = userProfile userId
    profile and profile.nickname or user.username or user.emails[0].address.split('@')[0]
  else
    '游客'

@imageUrl = (image, params)->
  if image and qiniuConfig.DOMAIN and Qiniu
    Qiniu.domain = qiniuConfig.DOMAIN
    if not params
      return Qiniu.getUrl image
    else
      return Qiniu.imageView2 params, image
  else
    return ''

@avatarUrl = (userId)->
  profile = userProfile userId
  return imageUrl(profile?.avatar, {mode: 1, w: 96}) or defaultAvatarUrl

@selectFavorites = (selector)->
  if selector.favoritesby
    # TODO 可以改进
    favs = Favorites.find({user: selector.favoritesby, category: selector.category}).fetch()
    favs = _.pluck favs, 'doc'
    selector = _.extend selector, {_id: {$in: favs}}
    selector = _.omit selector, 'favoritesby'
  return selector

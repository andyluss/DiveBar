Template.registerHelper 'dateString', (date)->
  moment(date).format('YYYY/M/D')

Template.registerHelper 'firstOne', (array)->
    if array and array.length > 0 then array[0] else ''

Template.registerHelper 'userName', (userId)->
  user = Meteor.users.findOne(userId)
  if user
    user.nickname or user.username or user.emails[0].address.split('@')[0]
  else
    '游客'

Template.registerHelper 'userUrl', (userId)->
  '/user/' + userId

Template.registerHelper 'firstPicture', ->
    if @pictures and @pictures.length > 0 then @pictures[0] else ''
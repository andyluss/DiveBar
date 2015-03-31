

Accounts.onCreateUser (options, user)->
  user.profileId = Profiles.insert {owner: user._id}
  return user

Meteor.startup ->
  # Create root admin
  if Meteor.users.find().count() == 0
    userId = Accounts.createUser
      email: 'root@divebar.com'
      password: 'test1234'
      username: 'root'
    Roles.addUsersToRoles userId, UserRoles.admin

Meteor.publishComposite 'user', (id)->
  {
    find: ->
      Meteor.users.find {_id: id}, {fields: {profileId: 1, username: 1, emails: 1}}
    children: [
      userProfileComposite()
    ]
  }


Meteor.publish 'myUserData', ->
  if @userId
    Meteor.users.find {_id: @userId}, {fields: {profileId : 1}}
  else
    @ready()

Meteor.publish null, ->
  Meteor.roles.find()

  #Meteor.publish 'users', ->
  #	Meteor.users.find {}

  #Meteor.publishComposite 'user', (_id)->
  #  return {
  #    find: ->
  #      Meteor.users.find {_id: _id}
  ##    children: [
  ##      find: (user)->
  ##
  ##    ]
  #  }

  #Meteor.publish 'userPicture', ->
  #	if Meteor.users.findOne({_id:@userId}) && Meteor.users.findOne({_id:@userId}).profile
  #		_id = Meteor.users.findOne({_id:@userId}).profile.picture
  #		ProfilePictures.find _id : _id
  #	else
  #		@ready()
  #
  #Meteor.publish 'profilePictures', ->
  #	ProfilePictures.find()


  #Meteor.users.allow
  #  update: (userId, doc, fieldNames, modifier) ->
  #    if userId == doc._id and not doc.username and fieldNames.length == 1 and fieldNames[0] == 'username'
  #      true
  #    else
  #      false

Meteor.publish 'user', (id)->
	Meteor.users.find {_id: id}

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
#	if Meteor.users.findOne({_id:this.userId}) && Meteor.users.findOne({_id:this.userId}).profile
#		_id = Meteor.users.findOne({_id:this.userId}).profile.picture
#		ProfilePictures.find _id : _id
#	else
#		@ready()
#
#Meteor.publish 'profilePictures', ->
#	ProfilePictures.find()


Meteor.users.allow
  update: (userId, doc, fieldNames, modifier) ->
    if userId == doc._id and not doc.username and fieldNames.length == 1 and fieldNames[0] == 'username'
      true
    else
      false

Meteor.methods
  deleteAccount: (userId) ->
    if @userId == userId
      Meteor.users.remove _id: @userId
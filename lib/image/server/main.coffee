Images.allow
  insert: checkUser
  update: checkUser
  remove: checkUser

Meteor.publish 'imagesUploaded', (creator)->
  check creator, String
  Images.find {creator: creator}
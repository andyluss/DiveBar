#Meteor.startup ->
#  console.log 'Image Uploads: ', Images.find().count()
#  Images.on 'removed', (fileObj)->
#    console.log 'Removed ' + fileObj._id + 'from Images'

Images.allow
  insert: checkUser
  update: checkUser
  remove: checkUser
  download: ->true

Meteor.publish 'imagesUploaded', (userId, creator)->
  check userId, String
  Images.find {user: userId, creator: creator}
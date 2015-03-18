#Meteor.startup ->
#  console.log 'Image Uploads: ', Images.find().count()
#  Images.on 'removed', (fileObj)->
#    console.log 'Removed ' + fileObj._id + 'from Images'

checkOwner = (userId, fileObj)->
  userId == fileObj.owner

Images.allow
  insert: checkOwner
  update: checkOwner
  remove: checkOwner
  download: ->true

Meteor.publish 'imagesUploaded', (userId, creator)->
  check userId, String
  Images.find {owner: userId, creator: creator}
#Meteor.startup ->
#  console.log 'Image Uploads: ', Images.find().count()
#  Images.on 'removed', (fileObj)->
#    console.log 'Removed ' + fileObj._id + 'from Images'

testFunc = (userId, fileObj)->
  userId == fileObj.owner

Images.allow
  insert: testFunc
  update: testFunc
  remove: testFunc
  download: ->true

Meteor.publish 'imagesUploaded', (userId, creator)->
  check userId, String
  Images.find {owner: userId, creator: creator}
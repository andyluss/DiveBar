Meteor.startup ->
  Template.imageUploader.events
    'change .image-input': (event, template)->
      creator = @creator
      FS.Utility.eachFile event, (file)->
        f = new FS.File file
        f.user = Meteor.userId()
        f.creator = creator
        if not f.name()
          f.name(f.creator)
        Images.insert f, (error, fileObj)->
          if error
            console.log error
          else
            console.log 'Image Inserted: ', fileObj.name()

#    'change .image-input': FS.EventHandlers.insertFiles Images,
#      metadata: (fileObj)->
#        user: Meteor.userId()
#        creator: @creator
#      after: (error, fileObj)->
#        if error
#          console.log error
#        else
#          console.log 'Image Inserted: ', fileObj.name()

Template.imageUploader.helpers
  imagesUploaded: ->
    imagesUploaded(@creator)

Template.imageUploader.rendered = ->
  Meteor.subscribe 'imagesUploaded', Meteor.userId(), @data.creator

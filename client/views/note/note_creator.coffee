creator = ''

Template.noteCreator.rendered = ->
  creator = new Date().toString()
  Meteor.subscribe 'imagesUploaded', Meteor.userId(), creator

Template.noteCreator.helpers
  uploadedImages: ->
    Images.find()

Meteor.startup ->
  Template.noteCreator.events
    'change .image-input': FS.EventHandlers.insertFiles Images,
      metadata: (fileObj)->
        owner: Meteor.userId()
        creator: creator
      after: (error, fileObj)->
        if error
          console.log error
        else
          console.log 'Image Inserted: ', fileObj.name()

Template.ionBody.events
  'click [data-action=save-note]': (event, template)->
    title = template.find('.note-creator .title').value
    content = template.find('.note-creator .content').value
    pictures = [];
    pictures.push image._id for image in Images.find().fetch()
    Notes.insert
      title: title
      content: content
      pictures: pictures

noteCreator = ->
  Session.get 'noteCreator'

Template.noteCreator.rendered = ->
  Session.set 'noteCreator', new Date().toString()
  Meteor.subscribe 'imagesUploaded', Meteor.userId(), noteCreator()

uploadedImages = ->
  Images.find {creator: noteCreator()}

Template.noteCreator.helpers
  uploadedImages: uploadedImages

Meteor.startup ->
  Template.noteCreator.events
    'change .image-input': FS.EventHandlers.insertFiles Images,
      metadata: (fileObj)->
        owner: Meteor.userId()
        creator: noteCreator()
      after: (error, fileObj)->
        if error
          console.log error
        else
          console.log 'Image Inserted: ', fileObj.name()

Template.ionNavBar.events
#  'mousedown': (event, template)->
#    if event.target == template.find '.back-button'
#      if not template.confirmed
#        template.confirmed = false
#        event.stopImmediatePropagation()
#        IonPopup.confirm
#          title: '要丢弃编辑吗？'
#          okText: '丢弃'
#          cancelText: '取消'
#          template: ''
#          onOk: ->
#            template.confirmed = true
#            back()

  'click [data-action=save-note]': (event, template)->
    title = $('.note-creator .title').val()
    if not title
#      alert '请输入标题'
      IonPopup.alert
        title: '请输入标题'
        okText: '确定'
      return
    content = $('.note-creator .content').val()
    pictures = [];
    pictures.push image._id for image in uploadedImages().fetch()
    Notes.insert(
      {
        title: title
        content: content
        pictures: pictures
      },
      (error, _id)->
        if error
          console.log 'Insert note error: ' + error
        else
          back()
    )


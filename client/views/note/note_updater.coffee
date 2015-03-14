noteCreator = ->
  Session.get 'noteCreator'

Template.noteCreator.rendered = ->
  Session.set 'noteCreator', new Date().toString()
  Meteor.subscribe 'imagesUploaded', Meteor.userId(), noteCreator()

uploadedImages = ->
  Images.find {creator: noteCreator()}

Template.noteCreator.helpers
  uploadedImages: uploadedImages

Template.ionNavBar.events
  'click': (event, template)->
    if event.target == template.find '.back-button'
      if not template.confirmed
        template.confirmed = false
#        event.stopImmediatePropagation()
#        IonPopup.confirm
#          title: '要丢弃编辑吗？'
#          okText: '丢弃'
#          cancelText: '取消'
#          onOk: ->
#            template.confirmed = true
#            back()

  'click [data-action=update-note]': (event, template)->
    title = $('.note-updater .title').val()
    if not title
      alert '请输入标题'
#      IonPopup.alert
#        title: 'sss'
#        template: '请输入标题'
#        okText: '确定'
      return
    content = $('.note-updater .content').val()
#    pictures = [];
#    pictures.push image._id for image in uploadedImages().fetch()
    Notes.update(
      {
        _id: @_id
      },
      {
        $set:
          title: title
          content: content
      },
      {
        upset: false
      },
      (error, _id)->
        if error
          console.log 'Update note error: ' + error
        else
          back()
    )


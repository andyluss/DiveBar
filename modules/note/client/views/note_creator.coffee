creator = (value)->
  if value
    Session.set 'creator', value
  else
    Session.get 'creator'

Template.noteCreator.created = ->
  creator newImageCreator()

Template.noteCreator.helpers
  creator: creator

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
    pictures.push image._id for image in imagesUploaded(creator()).fetch()

    Notes.insert(
      {
        title: title
        content: content
        pictures: pictures
        creator: creator()
      },
      (error, _id)->
        if error
          console.log 'Insert note error: ' + error
        else
          back()
    )


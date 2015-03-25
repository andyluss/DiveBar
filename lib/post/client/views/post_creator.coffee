creator = (value)->
  if value
    Session.set 'creator', value
  else
    Session.get 'creator'

Template.postCreator.created = ->
  creator newImageCreator()

Template.postCreator.helpers
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

  'click [data-action=save-post]': (event, template)->

    title = $('.post-creator .title').val()

    if not title
#      alert '请输入标题'
      IonPopup.alert
        title: '请输入标题'
        okText: '确定'
      return
    content = $('.post-creator .content').val()

    pictures = [];
    pictures.push image._id for image in imagesUploaded(creator()).fetch()

    window[plural s.capitalize @category].insert(
      {
        title: title
        content: content
        pictures: pictures
        creator: creator()
      },
      (error, _id)->
        if error
          console.log "Insert #{title} error: " + error
        else
          back()
    )


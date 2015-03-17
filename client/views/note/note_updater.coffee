Template.ionNavBar.events

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

    pictures = [];
    pictures.push image._id for image in imagesUploaded(@creator).fetch()

    updateSets = {}
    updateSets.title = title if title != @title
    updateSets.content = content if content != @content
    updateSets.pictures = pictures # Can improve

    Notes.update(
      {_id: @_id},
      {$set: updateSets},
      {upset: false},
      (error, _id)->
        if error
          console.log 'Update note error: ' + error
        else
          back()
    )

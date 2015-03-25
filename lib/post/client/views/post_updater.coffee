Template.ionNavBar.events

  'click [data-action=update-post]': (event, template)->
    title = $('.post-updater .title').val()
    if not title
      alert '请输入标题'
#      IonPopup.alert
#        title: 'sss'
#        template: '请输入标题'
#        okText: '确定'
      return
    content = $('.post-updater .content').val()

    pictures = [];
    pictures.push image._id for image in imagesUploaded(@creator).fetch()

    updateSets = {}
    updateSets.title = title if title != @title
    updateSets.content = content if content != @content
    updateSets.pictures = pictures # Can improve
    preTitle = @title

    window[plural s.capitalize @category].update(
      {_id: @_id},
      {$set: updateSets},
      {upset: false},
      (error, _id)->
        if error
          console.log "Update #{preTitle} error: " + error
        else
          back()
    )

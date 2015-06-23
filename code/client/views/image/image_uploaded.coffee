Template.imageUploaded.onRendered ->
  @$('.progress-container').hide()

Template.imageUploaded.helpers
  thumbUrl: -> imageUrl @, {mode: 1, w: 96, h: 96, q: 80}

Template.imageUploaded.events
  'click .delete.button': (event, template)->
    imageKeys = Template.parentData().imagesToUpload
    imageKeys.splice(imageKeys.indexOf(template.data), 1)
    delete Template.parentData().imageInfos[template.data]

  'click .image-container': (event, template)->
    imageKeys = Template.parentData().imagesToUpload
    index = imageKeys.indexOf template.data
    imageInfos = Template.parentData().imageInfos
    imageArray = []
    _.each imageKeys, (imageKey)->
      imageArray.push imageInfos[imageKey]
    imageInfos and showPhotoSwipe($('.pswp')[0], index, imageArray)
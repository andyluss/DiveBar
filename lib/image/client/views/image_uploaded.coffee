Template.imageUploaded.onRendered ->
  @$('.progress-container').hide()

Template.imageUploaded.helpers
  thumbUrl: -> imageUrl @, {mode: 2, w: 96, h: 96, q: 80}

Template.imageUploaded.events
  'click .delete.button': (event, template)->
    console.log Template.parentData()
    arr = Template.parentData().imagesToUpload
    arr.splice(arr.indexOf(template.data), 1)
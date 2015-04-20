Template.imageUploaded.helpers
  thumbUrl: ->
    if @uploaded
      imageUrl @, {mode: 2, w: 96, h: 96, q: 100}
    else
      '/images/loading.svg'

Template.imageUploaded.events
  'click .delete.button': (event, template)->
    Images.remove template.data._id
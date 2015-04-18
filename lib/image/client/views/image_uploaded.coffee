Template.imageUploaded.helpers
  thumbUrl: -> imageUrl @, {mode: 2, w: 96, h: 96, q: 100}

Template.imageUploaded.events
  'click .delete.button': (event, template)->
    Images.remove template.data._id
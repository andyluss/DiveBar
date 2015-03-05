Template.imageItem.helpers
  firstPicture: ->
    if @pictures and @pictures.length > 0 then @pictures[0] else ''

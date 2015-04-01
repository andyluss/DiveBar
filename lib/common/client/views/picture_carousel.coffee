Template.pictureCarousel.helpers
  pictures: ->
    images = imagesByCreator(@creator)
    return images

Template.pictureCarousel.events

  'click .picture-container': (event, template)->
    index = parseInt(event.currentTarget.getAttribute 'index')
    showPhotoSwipe(template.data, $('.pswp')[0], index)

showPhotoSwipe = (doc, container, index)->
  items = []

  getItem = (image)->
    url = image.url({store:'images'})
    if image
      item =
        src: url
        w: image.metadata.width
        h: image.metadata.height
    else
      console.log 'No Image, Id: ' + image._id
    return item

  items.push getItem picture for picture in imagesByCreator(doc.creator).fetch()

  options = {index: index}
  gallery = new PhotoSwipe container, PhotoSwipeUI_Default, items, options
  gallery.init()
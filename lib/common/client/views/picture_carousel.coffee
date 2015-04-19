Template.pictureCarousel.helpers
  pictures: -> imagesByCreator(@creator)
  imageSrc: -> imageUrl @, {mode: 2, w: screen.width, h: 200, q: 100}

Template.pictureCarousel.events

  'click .picture-container': (event, template)->
    index = parseInt(event.currentTarget.getAttribute 'index')
    showPhotoSwipe(template.data, $('.pswp')[0], index)

showPhotoSwipe = (doc, container, index)->
  items = []

  getItem = (image)->
    url = imageUrl image
    if image
      item =
        src: url
        w: image.width
        h: image.height
    else
      console.log 'No Image, Id: ' + image._id
    return item

  items.push getItem picture for picture in imagesByCreator(doc.creator).fetch()

  options = {index: index}
  gallery = new PhotoSwipe container, PhotoSwipeUI_Default, items, options
  gallery.init()
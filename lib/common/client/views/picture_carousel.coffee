imageInfos = []

Template.pictureCarousel.helpers
  imageSrc: ->
    url = imageUrl @, {mode: 2, w: screen.width, h: 200, q: 100}
    imageInfo = {}
    imageInfos.push imageInfo
    qiniuImageInfo(@, imageInfo)
    return url

Template.pictureCarousel.events

  'click .picture-container': (event, template)->
    index = parseInt(event.currentTarget.getAttribute 'index')
    showPhotoSwipe(template.data, $('.pswp')[0], index)

showPhotoSwipe = (doc, container, index)->
  options = {index: index}
  gallery = new PhotoSwipe container, PhotoSwipeUI_Default, imageInfos, options
  gallery.init()
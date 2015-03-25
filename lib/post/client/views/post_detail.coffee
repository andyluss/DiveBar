Template.postDetail.helpers
  commentStrings: ->
    'add-button': '提交'
    'placeholder-textarea': '你有什么想表达的...'

Template.postDetail.events

  'click .picture-container': (event, template)->
    index = parseInt(event.currentTarget.getAttribute 'index')
    showPhotoSwipe(template.data, $('.pswp')[0], index)

Template.ionNavBar.events
  'click [data-action=post-more]': (event, template)->
    showActionSheet(this)

showPhotoSwipe = (doc, container, index)->
  items = []

  getItem = (imageId)->
    image = Images.findOne(imageId)
    url = image.url({store:'images'})
    if image
      item =
        src: url
        w: image.metadata.width
        h: image.metadata.height
    else
      console.log 'No Image, Id: ' + imageId
    return item

  items.push getItem picture for picture in doc.pictures

  options =
    index: index
  gallery = new PhotoSwipe container, PhotoSwipeUI_Default, items, options
  gallery.init()

showActionSheet = (doc)->
  if doc.owner == Meteor.userId()
    IonActionSheet.show
      titleText: '选项'
      cancelText: '取消'
      destructiveText: '删除'
      buttons: [
        {text: '分享'}
        {text: '编辑'}
      ]
      destructiveButtonClicked: ->
        deletePost(doc)
        return true
      buttonClicked: (index)->
        switch index
          when 0
            console.log 'Share'
            return true
          when 1
            editPost(doc)
        return true
  else
    IonActionSheet.show
      titleText: '选项'
      cancelText: '取消'
      buttons: [
        {text: '分享'}
      ]
      buttonClicked: (index)->
        switch index
          when 0
            console.log 'Share'
            return true
        return true

editPost = (doc)->
  Router.go doc.category + '.updater', {id: doc._id}

deletePost = (doc)->
  showConfirm = ->
    IonActionSheet.show
      titleText: '确认删除？'
      cancelText: '取消'
      destructiveText: '删除'
      buttons: []
      destructiveButtonClicked: ->
        back()
        window[plural s.capitalize doc.category].remove {_id: doc._id}
        return true
  Meteor.setTimeout showConfirm, 800
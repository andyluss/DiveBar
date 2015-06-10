Template.certificateList.helpers
  firstPictureThumb: -> imageUrl(@images?[0], {mode: 1, w: 100})

Template.certificateList.events
  'click .certificate-item': (event, template)-> Router.go "/certificate/detail?id=#{@_id}"

Template.ionNavBar.events

  'click [data-action=create-certificate]': -> Router.go '/certificate/creator'



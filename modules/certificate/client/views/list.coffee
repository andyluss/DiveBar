Template.certificateList.helpers
  firstPictureThumb: -> imageUrl(@images?[0], {mode: 1, w: 120})

Template.ionNavBar.events

  'click [data-action=create-certificate]': -> Router.go '/certificate/creator'



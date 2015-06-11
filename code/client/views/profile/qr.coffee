Template.profileQr.rendered = ->
  $('.qr-code').qrcode
    text: myId()

Template.myCardQr.rendered = ->
  $('.qr-code').qrcode
    text: myId()

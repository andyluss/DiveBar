
Session.set "Mongol",
  'collections': ['Notes', 'Journeys', 'Products', 'Says']
  'display': false
  'opacity_normal': ".7"
  'opacity_expand': ".9"

Session.set 'platformOverride', 'iOS'

Platform.isAndroid = -> false

document.addEventListener "backbutton",
  (e)->
    e.preventDefault()
  , false
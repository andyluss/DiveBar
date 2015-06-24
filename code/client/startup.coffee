
Session.set "Mongol",
  'collections': ['Notes', 'Journeys', 'Products', 'Says']
  'display': false
  'opacity_normal': ".7"
  'opacity_expand': ".9"

Session.set 'platformOverride', 'iOS'

Platform.isAndroid = -> false

Template.ionBody.helpers
  platformClasses: ->
    classes = ['grade-a', 'fullscreen']

    if Meteor.isCordova
      classes.push 'platform-cordova'

    if Meteor.isClient
      classes.push 'platform-web'

    if ((Meteor.isCordova and Platform.isIOS()) or Session.get('platformOverride') is 'iOS')
      classes.push 'platform-ios'

    if ((Meteor.isCordova and Platform.isAndroid()) or Session.get('platformOverride') is 'Android')
      classes.push 'platform-android'

    return classes.join(' ');

document.addEventListener "backbutton",
  (e)->
    e.preventDefault()
  , false
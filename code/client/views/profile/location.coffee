Template.profileLocation.onRendered ->
  @find('.profile-input').focus()

Template.ionNavBar.events
  'click [data-action=save-location]': (event, template)->
    value = $('.profile.location input').val()
    if value
      Profiles.update {_id: @_id}, {$set: {location: value}}
      back()
Template.ionNavBar.events
  'click [data-action=save-location]': (event, template)->
    value = $('.my-card-location input').val()
    if value
      Profiles.update {_id: Meteor.user().profileId}, {$set: {location: value}}
      back()
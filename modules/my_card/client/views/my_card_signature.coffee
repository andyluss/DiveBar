Template.ionNavBar.events
  'click [data-action=save-signature]': (event, template)->
    value = $('.my-card-signature textarea').val()
    if value
      Profiles.update {_id: Meteor.user().profileId}, {$set: {signature: value}}
      back()
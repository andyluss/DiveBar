Template.ionNavBar.events
  'click [data-action=save-qq]': (event, template)->
    value = $('.my-card-qq input').val()
    if value
      Profiles.update {_id: Meteor.user().profileId}, {$set: {qq: value}}
      back()
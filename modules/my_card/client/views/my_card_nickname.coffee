Template.ionNavBar.events
  'click [data-action=save-nickname]': (event, template)->
    value = $('.my-card-nickname input').val()
    if value
      Profiles.update {_id: Meteor.user().profileId}, {$set: {nickname: value}}
      back()
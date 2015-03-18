Template.ionNavBar.events
  'click [data-action=save-wechat]': (event, template)->
    value = $('.my-card-wechat input').val()
    if value
      Profiles.update {_id: Meteor.user().profileId}, {$set: {wechat: value}}
      back()
Template.ionNavBar.events
  'click [data-action=save-mobile]': (event, template)->
    value = $('.my-card-mobile input').val()
    if value
      if not new RegExp('/^[0-9]{5,20}$/').test value
        alert '请输入正确的手机号码'
      else
        Profiles.update {_id: Meteor.user().profileId}, {$set: {mobile: value}}
        back()
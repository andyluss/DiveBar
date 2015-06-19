Template.profileWechat.onRendered ->
  @find('.profile-input').focus()

Template.ionNavBar.events
  'click [data-action=save-wechat]': (event, template)->
    value = $('.profile.wechat input').val()
    if value
      Profiles.update {_id: @_id}, {$set: {wechat: value}}
      back()
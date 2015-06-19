Template.profileQq.onRendered ->
  @find('.profile-input').focus()

Template.ionNavBar.events
  'click [data-action=save-qq]': (event, template)->
    value = $('.profile.qq input').val()
    if value
      Profiles.update {_id: @_id}, {$set: {qq: value}}
      back()
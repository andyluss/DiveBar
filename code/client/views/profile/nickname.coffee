Template.ionNavBar.events
  'click [data-action=save-nickname]': (event, template)->
    value = $('.profile.nickname input').val()
    if value
      Profiles.update {_id: @_id}, {$set: {nickname: value}}
      back()
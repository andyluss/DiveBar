Template.ionNavBar.events
  'click [data-action=save-signature]': (event, template)->
    value = $('.profile.signature textarea').val()
    if value
      Profiles.update {_id: @_id}, {$set: {signature: value}}
      back()
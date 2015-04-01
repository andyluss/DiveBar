Template.ionNavBar.events
  'click [data-action=save-mobile]': (event, template)->
    value = $('.profile-mobile input').val()
    console.log(value)
    if value
      if not new RegExp('/^[0-9]{5,20}$/').test(value)
        alert '请输入正确的手机号码'
      else
        Profiles.update {_id: @_id}, {$set: {mobile: value}}
        back()
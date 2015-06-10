Template.ionNavBar.events
  'click [data-action=save-mobile]': (event, template)->
    value = $('.profile.mobile input').val()
    if value
      if not /^[0-9]{5,20}$/.test(value)
        IonPopup.alert
          title: '请输入正确的手机号码'
          template: ''
      else
        Profiles.update {_id: @_id}, {$set: {mobile: value}}
        back()
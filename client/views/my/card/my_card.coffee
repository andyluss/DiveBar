Template.myCard.rendered = ->
  Session.set SessionKeys.currentTab, 'my.card'
  $('.qr-code').qrcode
    text: myId()

Template.myCard.helpers
  nickname: ->
    @nickname or '添加昵称'
  location: ->
    @location or '添加地址'
  avatarUrl: ->
    profile = userProfile myId()
    profile and imageUrl(profile.avatar) or defaultAvatarUrl


Template.myCard.events
  'click [data-action=change-avatar]': ->
    IonActionSheet.show
      titleText: '选项'
      cancelText: '取消'
      buttons: [
        {text: '拍照'}
        {text: '从相册选择'}
      ]
      buttonClicked: (index)->
        switch index
          when 0
            toCamera()
          when 1
            toPhotoLibrary()
        return true

avatarName = ->
  'avatar-' + Meteor.userId()

getPicture = (options)->
  options ?= {}
  options = _.defaults options,
    width: 200
    height: 200
    quality: 90
  MeteoricCamera.getPicture options, (error, data)->
    if error
      console.log error
      return
    f = new FS.File data
    f.owner = Meteor.userId()
    f.creator = newImageCreator()
    f.name(avatarName())
    Images.insert f, (error, fileObj)->
      if error
        console.log error
      else
        updateAvatar fileObj._id
        console.log 'Image Inserted: ', fileObj.name()

updateAvatar = (imageId)->
  Profiles.update {_id: Meteor.user().profileId}, {$set: {avatar: imageId}}

toCamera = ->
  getPicture()

toPhotoLibrary = ->
  if Meteor.isCordova
    options =
      sourceType: Camera.PictureSourceType.PHOTOLIBRARY
    getPicture options
  else
    alert 'Cordova only feature.'
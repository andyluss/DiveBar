Template.profileMain.onRendered ->
  @$('.qr-code').qrcode
    text: userById(@data.user)

getLine = (type, label)->
  label: label
  data: @[type]
  href: isMe(@user) and "/profile?type=#{type}&user=#{@user}" or ''
  icon: isMe(@user) and "ios-arrow-right" or ''

Template.profileMain.helpers
  title: -> userPrefix(@user, true) + '名片'
  nickname: -> @nickname or (isMe(@user) and '添加昵称' or '')
  location: -> @location or (isMe(@user) and '添加地址' or '')
  nicknameEditorUrl: -> isMe(@user) and "/profile?type=nickname&user=#{@user}" or ''
  locationEditorUrl: -> isMe(@user) and "/profile?type=location&user=#{@user}" or ''

  lines: -> [
    getLine.call(@, 'qq', 'QQ')
    getLine.call(@, 'wechat', '微信')
    getLine.call(@, 'mobile', '手机号')
    getLine.call(@, 'signature', '签名')
  ]

  myFavoriteUsersPath: -> "/user/list?favoritesby=#{myId()}"

Template.ionNavBar.events

  'click [data-action=logout]': ()-> Meteor.logout()

Template.profileMain.events

  'click [data-action=change-avatar]': ->
    if not isMe(@user)
      return
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
  'avatar-' + myId() + '-' + new Date().getTime()

getPicture = (options)->
  options ?= {}
  options = _.defaults options,
    width: 96
    height: 96
    quality: 90
  MeteoricCamera.getPicture options, (error, data)->
    if error
      console.log error
      return
    Meteor.call 'uptoken', (error, result)->
      if error
        console.log error
      else
        key = avatarName() + '.jpeg'
        Images.insert(
          {
            creator: newImageCreator()
            key: key
            base64: data
          },
          (error, _id)->
            if error
              console.log error
            else
              updateAvatar _id
        )
#        Meteor.call 'uploadToQiniu', {token: result, key: key, body: data}, (err, ret)->
#          if err
#            console.log err
#          else
#            Images.insert(
#              {
#                creator: newImageCreator()
#                key: key
#              },
#              (error, _id)->
#                if error
#                  console.log error
#                else
#                  updateAvatar _id
#            )

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
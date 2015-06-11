Template.certificateDetail.helpers
  hasPicture: -> @images?.length > 0

Template.ionNavBar.events
  'click [data-action=certificate-more]': (event, template)-> showActionSheet @

showActionSheet = (doc)->
  if canEdit doc
    IonActionSheet.show
      titleText: '选项'
      cancelText: '取消'
      destructiveText: '删除'
      buttons: [
        {text: '编辑'}
      ]
      destructiveButtonClicked: ->
        deleteCertificate(doc)
        return true
      buttonClicked: (index)->
        switch index
          when 0
            editCertificate(doc)
        return true

toShare = (doc)->
  if Meteor.isCordova
    window.plugins.socialsharing.share doc.desc, doc.num, imageUrl(doc.images?[0]), currentUrl()
  else
    alert '这是手机上才有的功能。'

editCertificate = (doc)->
  Router.go "/certificate/updater?id=#{doc._id}"

deleteCertificate = (doc)->
  showConfirm = ->
    IonActionSheet.show
      titleText: '确认删除？'
      cancelText: '取消'
      destructiveText: '删除'
      buttons: []
      destructiveButtonClicked: ->
        back()
        Certificates.remove {_id: doc._id}
        return true
  Meteor.setTimeout showConfirm, 800
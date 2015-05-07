Template.postDetail.helpers
  commentStrings: ->
    'add-button': '提交'
    'placeholder-textarea': '你有什么想表达的...'
  hasPicture: -> @images?.length > 0
  moreDetailTemplate: -> Template["#{@category}MoreDetail"]? and "#{@category}MoreDetail" or false
  detailContent: -> Template["#{@category}DetailContent"]? and "#{@category}DetailContent" or false

Template.ionNavBar.events
  'click [data-action=post-more]': (event, template)-> showActionSheet @

showActionSheet = (doc)->
  if canEdit doc
    IonActionSheet.show
      titleText: '选项'
      cancelText: '取消'
      destructiveText: '删除'
      buttons: [
        {text: '分享'}
        {text: '编辑'}
      ]
      destructiveButtonClicked: ->
        deletePost(doc)
        return true
      buttonClicked: (index)->
        switch index
          when 0
            toShare(doc)
          when 1
            editPost(doc)
        return true
  else
    IonActionSheet.show
      titleText: '选项'
      cancelText: '取消'
      buttons: [
        {text: '分享'}
      ]
      buttonClicked: (index)->
        switch index
          when 0
            toShare(doc)
        return true

toShare = (doc)->
  if Meteor.isCordova
    window.plugins.socialsharing.share doc.content, doc.title, imageUrl(doc.images?[0]), currentUrl()
  else
    alert '这是手机上才有的功能。'

editPost = (doc)->
  Router.go "/post/updater?category=#{doc.category}&id=#{doc._id}"

deletePost = (doc)->
  showConfirm = ->
    IonActionSheet.show
      titleText: '确认删除？'
      cancelText: '取消'
      destructiveText: '删除'
      buttons: []
      destructiveButtonClicked: ->
        back()
        coln(doc.category).remove {_id: doc._id}
        return true
  Meteor.setTimeout showConfirm, 800
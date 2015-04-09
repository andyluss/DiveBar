Template.postDetail.helpers
  commentStrings: ->
    'add-button': '提交'
    'placeholder-textarea': '你有什么想表达的...'
  hasPicture: -> imagesByCreator(@creator).count() > 0
  moreDetailTemplate: -> "#{@category}MoreDetail"

Template.ionNavBar.events
  'click [data-action=post-more]': (event, template)->
    showActionSheet @

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
            console.log 'Share'
            return true
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
            console.log 'Share'
            return true
        return true

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
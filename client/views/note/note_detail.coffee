Template.noteDetail.helpers
  commentStrings: ->
    return {
      'add-button': '提交'
      'placeholder-textarea': '你有什么想表达的...'
    }

  isStored: ->
    true

Template.ionBody.events
  'click [data-action=noteMoreAction]': (event, template)->
    doc = this

    IonActionSheet.show

      titleText: '选项'
      cancelText: '取消'
      destructiveText: '删除'
      buttons: [
        {text: '分享'}
        {text: '编辑'}
      ]

      destructiveButtonClicked: ->
        showConfirm = ->
          IonActionSheet.show
            titleText: '确认删除？'
            cancelText: '取消'
            destructiveText: '删除'
            buttons: []
            destructiveButtonClicked: ->
              back()
              Notes.remove {_id: doc._id}
              return true
        Meteor.setTimeout showConfirm, 800
        return true

      buttonClicked: (index)->
        switch index
          when 0
            console.log 'Share'
            return true
          when 1
            console.log 'Edit'
        return true
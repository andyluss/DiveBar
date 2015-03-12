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
    console.log this
    IonActionSheet.show
      cancelText: '取消'
      destructiveText: '删除'
      buttons: [
        {text: '分享'}
        {text: '编辑'}
      ]
      destructiveButtonClicked: ->
        console.log 'Delete'
        @remove()
      buttonClicked: (index)->
        switch index
          when 0
            console.log 'Share'
          when 1
            console.log 'Edit'
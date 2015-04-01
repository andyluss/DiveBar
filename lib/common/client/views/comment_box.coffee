
Template.commonCommentSingle.inheritsHelpersFrom 'commentsSingleComment'
Template.commonCommentTextarea.inheritsHelpersFrom 'commentsTextarea'

Template.commonCommentBox.helpers
  commentCount: ->
    Counts.get getCommentCountName(@id)

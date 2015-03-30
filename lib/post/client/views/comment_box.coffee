
Template.postCommentSingle.inheritsHelpersFrom 'commentsSingleComment'
Template.postCommentTextarea.inheritsHelpersFrom 'commentsTextarea'

Template.postCommentBox.helpers
  commentCount: ->
    Counts.get getCommentCountName(@id)

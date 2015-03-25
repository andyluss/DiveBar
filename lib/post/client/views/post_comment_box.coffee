
Template.postCommentSingle.inheritsHelpersFrom 'commentsSingleComment'
Template.postCommentTextarea.inheritsHelpersFrom 'commentsTextarea'

Template.postCommentBox.helpers
  commentCount: ->
    Comments.session.get(@id + '_count');
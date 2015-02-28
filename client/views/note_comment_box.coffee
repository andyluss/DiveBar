
Template.noteCommentSingle.inheritsHelpersFrom 'commentsSingleComment'
Template.noteCommentTextarea.inheritsHelpersFrom 'commentsTextarea'

Template.noteCommentBox.helpers
  commentCount: ->
    Comments.session.get(@id + '_count');
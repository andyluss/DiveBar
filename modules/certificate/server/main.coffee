Certificates.allow
  insert: checkUser
  update: checkUser
  remove: checkUser

Meteor.publishComposite 'certificateList', (selector)->
  {
  find: ->
    Certificates.find(selector, {sort: {date: -1}})
  }

Meteor.publishComposite 'certificate', (_id)->
  {
  find: ->
    Certificates.find {_id: _id}
  }
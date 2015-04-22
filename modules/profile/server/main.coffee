Meteor.publishComposite 'profile', (user)->
  {
    find: -> Profiles.find {user: user}
  }



Profiles.allow
  update: (userId, doc)->
    userId == doc.user
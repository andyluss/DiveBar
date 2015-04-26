Meteor.publishComposite 'profile', (user)->
  {
    find: -> Profiles.find {user: user}
  }

Profiles.allow
  update: checkUser
Meteor.publishComposite 'profile', (user)->
  {
    find: ->
      Profiles.find {user: user}
    children: [
      {
        find: (profile)->
          Images.find {_id: profile.avatar}
      }
    ]
  }



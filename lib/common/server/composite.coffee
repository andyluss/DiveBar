@userProfileComposite = ->
  find: (user)-> Profiles.find {_id: user.profileId}, {fields: {nickname: 1, avatar: 1, user: 1}}
  children: [
    {
      find: (profile)->
        Images.find {_id: profile.avatar}
    }
  ]

@docUserComposite = ->
  find: (doc)-> Users.find {_id: doc.user}, {fields: {profileId: 1, username: 1, emails: 1}}
  children: [
    userProfileComposite()
  ]
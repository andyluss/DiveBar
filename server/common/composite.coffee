@userProfileComposite = ->
  find: (user)->
    Profiles.find {_id: user.profileId}, {fields: {nickname: 1, avatar: 1, owner: 1}}

@docUserComposite = ->
  find: (doc)->
    Meteor.users.find {_id: doc.owner}, {fields: {profileId: 1, username: 1, emails: 1}}
  children: [
    userProfileComposite()
  ]
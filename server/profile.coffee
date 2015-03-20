#Meteor.publishComposite 'profile', (_id)->
#  {
#  find: ->
#    Profiles.find {_id: _id}
#  children: [
#    {
#      find: (doc)->
#        Meteor.users.find {_id: doc.owner}
#    }
#    {
#      find: (doc)->
#        Images.find {_id: {$in: doc.pictures}}
#    }
#  ]
#  }

Meteor.publishComposite 'profileByOwner', (owner)->
  {
    find: ->
      Profiles.find {owner: owner}
    children: [
      {
        find: (profile)->
          Images.find {_id: profile.avatar}
      }
    ]
  }


Profiles.allow
  update: (userId, doc)->
    userId == doc.owner

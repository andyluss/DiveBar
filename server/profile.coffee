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

Meteor.publish 'profileByOwner', (owner)->
  Profiles.find {owner: owner}

Profiles.allow
  update: (userId, doc)->
    userId == doc.owner

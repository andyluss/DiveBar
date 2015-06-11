@userProfileComposite = -> find: (user)-> Profiles.find {_id: user.profileId}, {fields: {nickname: 1, avatar: 1, user: 1}}

@docMoreInfoComposite = ->
  find: (doc)->
    # Comments count
    Counts.publish @, getCommentCountName(doc._id), Comments.get(doc._id), {noReady: true}
    Users.find {_id: doc.user}, {fields: {profileId: 1, username: 1, emails: 1}}
  children: [userProfileComposite()]

Meteor.publishComposite 'certificateList', (selector)-> find: -> Certificates.find(selector, {sort: {date: -1}})

Meteor.publishComposite 'certificate', (_id)-> find: -> Certificates.find {_id: _id}

Meteor.publishComposite 'profile', (user)-> find: -> Profiles.find {user: user}


Meteor.publishComposite 'userList', (selector, limit)->
  find: ->
    category = selector.category
    # Count
    Counts.publish @, getCountName(selector), Users.find(_.omit(selector, 'category')), {noReady: true}

    selector = selectFavorites(selector)
    Users.find(_.omit(selector, 'category'), {limit: limit, fields: {profileId: 1, username: 1, emails: 1}})
  children: [userProfileComposite()]

Meteor.publishComposite 'user', (id)->
  find: -> Users.find {_id: id}, {fields: {profileId: 1, username: 1, emails: 1}}
  children: [userProfileComposite()]

Meteor.publish null, -> Meteor.roles.find()



Meteor.publishComposite 'postList', (selector, limit)->
  find: ->
    category = selector.category

    # Count
    Counts.publish @, getCountName(selector), Posts.find(selector), {noReady: true}

    selector = selectFavorites(selector)
    Posts.find(selector, {limit: limit, sort: [['createdAt', 'desc']]})

  children: [docMoreInfoComposite()]

Meteor.publishComposite 'post', (category, _id)->
  find: -> Posts.find {_id: _id}
  children: [docMoreInfoComposite()]

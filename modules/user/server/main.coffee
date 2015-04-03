
Accounts.onCreateUser (options, user)->
  user.profileId = Profiles.insert {user: user._id}
  return user

Meteor.startup ->
  # Create root admin
  if Users.find().count() == 0
    userId = Accounts.createUser
      email: 'root@divebar.com'
      password: 'test1234'
      username: 'root'
    Roles.addUsersToRoles userId, UserRoles.admin

Meteor.publishComposite 'userList', (selector, limit)->
  {
    find: ->
      category = selector.category
      # Count
      Counts.publish @, getCountName(selector), coln(category).find(_.omit(selector, 'category')), {noReady: true}

      selector = selectFavorites(selector)
      Users.find(_.omit(selector, 'category'), {limit: limit, fields: {profileId: 1, username: 1, emails: 1}})
    children: [
      userProfileComposite()
    ]
  }

Meteor.publishComposite 'user', (id)->
  {
    find: ->
      Users.find {_id: id}, {fields: {profileId: 1, username: 1, emails: 1}}
    children: [
      userProfileComposite()
    ]
  }

Meteor.publish null, ->
  Meteor.roles.find()

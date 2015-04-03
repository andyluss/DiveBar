@Users = Meteor.users

Users.attachSchema new SimpleSchema

  username:
    type: String
    regEx: /^[a-z0-9A-Z_]{3,15}$/
    optional: true

  emails:
    type: [Object]

  "emails.$.address":
    type: String
    regEx: SimpleSchema.RegEx.Email

  "emails.$.verified":
    type: Boolean

  createdAt:
    type: Date

  profileId:
    type: String
    regEx: SimpleSchema.RegEx.Id
    optional: true

  roles:
    type: [String]
    optional: true

  services:
    type: Object
    optional: true
    blackbox: true

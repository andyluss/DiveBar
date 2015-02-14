UserProfileSchema = new SimpleSchema

  picture:
    type: String
    optional:true
    label: 'Profile picture'
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'ProfilePictures'

  firstName:
    type: String
    optional: true

  lastName:
    type: String
    optional: true

UserSchema = new SimpleSchema

  username:
    type: String
    regEx: /^[a-z0-9A-Z_]{3,15}$/
    optional: false

  emails:
    type: [Object]
    optional: true

  "emails.$.address":
    type: String
    regEx: SimpleSchema.RegEx.Email

  "emails.$.verified":
    type: Boolean

  createdAt:
    type: Date

  profile:
    type: UserProfileSchema
    optional: true

  services:
    type: Object
    optional: true
    blackbox: true

  roles:
    type: [String]
    blackbox: true
    optional: true


Meteor.users.attachSchema UserSchema



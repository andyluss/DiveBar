UserProfileSchema = new SimpleSchema

  picture:
    type: String
    optional:true
    label: '头像'
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'ProfilePictures'

  nickname:
    type: String
    label: '昵称'
    optional: true

UserSchema = new SimpleSchema

  username:
    type: String
    regEx: /^[a-z0-9A-Z_]{3,15}$/
    optional: true

  emails:
    type: [Object]
    optional: false

  "emails.$.address":
    type: String
    optional: false
    regEx: SimpleSchema.RegEx.Email

  "emails.$.verified":
    type: Boolean

  createdAt:
    type: Date

  profile:
    type: UserProfileSchema
    optional: true

  roles:
    type: [String]
    optional: true

  services:
    type: Object
    optional: true
    blackbox: true


Meteor.users.attachSchema UserSchema



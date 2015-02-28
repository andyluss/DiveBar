Template.registerHelper 'dateString', (date)->
  moment(date).format('YYYY/M/D')

Template.registerHelper 'ownerName', (owner)->
  Meteor.users.findOne(owner).username

Template.registerHelper 'ownerUrl', (owner)->
  '/user/' + owner

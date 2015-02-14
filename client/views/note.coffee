Template.note.rendered = ->
  $('#note-carousel').slick
    dots: true
    mobileFirst: true
#    autoplay: true

Template.registerHelper 'dateString', (note)->
  moment(@date).format('YYYY/M/D')

Template.registerHelper 'ownerName', (note)->
  Meteor.users.findOne(note.owner).username

Template.registerHelper 'ownerUrl', (note)->
  '/user/' + note.owner

Template.myCard.rendered = ->
  Session.set SessionKeys.currentTab, 'my.card'

Template.myCard.helpers
  nickname: ->
    @nickname or '添加昵称'
  location: ->
    @location or '添加地址'

Template.myCard.events
  'click [data-action=change-avatar]': ->

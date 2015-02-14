Template.journey.rendered = ->


Template.journey.helpers

  journeyType: ->
    if not Session.get 'journeyType'
      Session.set 'journeyType', 1
    Session.get 'journeyType'

  journeyTitle: ->
    if Session.get('journeyType') == 1 then '官方行程' else '潜友行程'
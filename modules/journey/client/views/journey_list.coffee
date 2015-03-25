checkCategory = ->
  Session.setDefault 'journeyCategory', 'official'

category = (value)->
  if value?
    Session.set 'journeyCategory', value
  else
    checkCategory()
    Session.get 'journeyCategory'

Template.journeyList.helpers

  isSelect: (_category)->
    if category() == _category then 'selected' else ''

  journeyTitle: ->
    JourneyCategory2Label[category()]

Template.journeyList.events

  'click .official': ->
    category 'official'

  'click .user': ->
    category 'user'

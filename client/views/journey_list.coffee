Template.journeyList.helpers

  isSelectOfficial: ->
    if @category == JourneyCategory.official then 'selected' else ''

  isSelectUser: ->
    if @category == JourneyCategory.user then 'selected' else ''

  journeyTitle: ->
    JourneyTitle[@category]
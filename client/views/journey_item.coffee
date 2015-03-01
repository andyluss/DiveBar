Template.journeyItem.helpers
  firstPicture: ->
    @pictures[0]
  isOfficial: ->
    @category == JourneyCategory.official
@JourneyListController = ContentController.extend
  template: 'journeyList'
  onAfterAction: ->
    subManager.subscribe 'journeysTopOfficial'
    subManager.subscribe 'journeysTopUser'
  data: ->
    listOfficial: Journeys.find {category: 'official'}, {sort: {date: -1}}
    listUser: Journeys.find {category: 'user'}, {sort: {date: -1}}
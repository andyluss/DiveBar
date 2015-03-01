@JourneyListController = ContentController.extend
  template: 'journeyList'
  waitOn: ->
    Meteor.subscribe 'journeysTop', @params.category
  data: ->
    {
      category: @params.category
      list: Journeys.find {category: @params.category}, {sort: {date: -1}}
    }
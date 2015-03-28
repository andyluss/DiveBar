Template.userJourneyItem.events
  'click .right-box': ->
    Router.go 'journey.detail', {id: @_id}
Template.journeyListItemOfficial.helpers
  firstImage: -> imageUrl @images?[0], {mode: 1, w: 100, h: 100, q: 80}

Template.journeyListItemOfficial.events

  'click': -> Router.go "/post/detail?category=#{@category}&id=#{@_id}"


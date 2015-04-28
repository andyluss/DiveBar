Template.postSearch.helpers
  index: -> plural @category

Template.postSearch.events
  'click .result-item': (event, template)->
    Router.go "/post/detail?category=#{template.data.category}&id=#{@id}"
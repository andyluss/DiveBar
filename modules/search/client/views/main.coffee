Template.search.helpers
  indexes: -> ['notes', 'journeys', 'products', 'says', 'profiles']
  postIndex: -> plural @

Template.search.events

  'click .result-item.post': (event, template)-> Router.go "/post/detail?category=#{@category}&id=#{@id}"
  'click .result-item.profile': (event, template)-> Router.go "/profile?type=main&user=#{@user}"

#  'click .type-tab.type-user': -> Router.go "/user/search"


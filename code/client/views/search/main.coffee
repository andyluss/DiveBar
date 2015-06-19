Template.search.onRendered ->
  @find('.query-input').focus()

Template.search.helpers
  label: -> label @category
  placeholder: -> "搜索#{label @category}..."
  index: -> pcap @category

Template.search.events
  'click .result-item.post': (event, template)-> Router.go "/post/detail?category=#{@category}&id=#{@id}"

label = (category)-> postCategoryLabel category

clearSearchIndex = (category)->
  instance = EasySearch.getComponentInstance {index: 'Posts'}
  if instance then instance.clear()
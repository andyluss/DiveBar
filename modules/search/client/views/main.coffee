Template.search.helpers
  indexes: -> indexes @category
  label: -> label @category
  placeholder: -> "搜索#{label @category}..."

Template.search.events
  'click .result-item.post': (event, template)-> Router.go "/post/detail?category=#{@category}&id=#{@id}"

label = (category)-> postCategoryLabel category

indexes = (category)-> plural(category)

clearSearchIndex = (category)->
  instance = EasySearch.getComponentInstance {index: indexes(category)}
  if instance then instance.clear()
type = new ReactiveVar('')

Template.search.onCreated -> type.set @data.type

Template.search.helpers
  tabs: -> ['note', 'journey', 'product', 'say', 'profile']
  isHidden: -> (('' + @) != type.get()) and 'hidden' or ''
  indexes: -> indexes ('' + @)
  postIndex: -> plural @
  isSelect: (tabType)-> tabType is type.get() and 'selected' or ''
  label: -> label ('' + @)
  placeholder: -> "搜索#{label ('' + @)}..."
  isPost: (type)-> ('' + type) in ['note', 'journey', 'product', 'say']
  isProfile: (type)-> ('' + type) is 'profile'

Template.search.events

  'click .result-item.post': (event, template)-> Router.go "/post/detail?category=#{@category}&id=#{@id}"
  'click .result-item.profile': (event, template)-> Router.go "/profile?type=main&user=#{@user}"
  'click .type-tab': (event, template)->
    type.set('' + @)
    typeText = template.$('.' + type.get() + ' .query-input').val()
    if not typeText
      clearSearchIndex type.get()

#  'click .type-tab.type-user': -> Router.go "/user/search"

label = (type)->
  switch type
    when 'profile' then '用户'
    else postCategoryLabel type

indexes = (type)-> plural(type)

clearSearchIndex = (type)->
  instance = EasySearch.getComponentInstance {index: indexes(type)}
  if instance then instance.clear()
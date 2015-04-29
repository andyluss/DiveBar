Template.search.helpers
  indexes: -> @type is 'all' and ['notes', 'journeys', 'products', 'says', 'profiles'] or plural(@type)
  postIndex: -> plural @
  isSelect: (type)-> s.contains(currentPath(), type) and 'selected' or ''
  placeholder: ->
    typeLabel = switch @type
      when 'all' then '全部'
      when 'profile' then '用户'
      else postCategoryLabel @type
    return "搜索#{typeLabel}..."

Template.search.events

  'click .result-item.post': (event, template)-> Router.go "/post/detail?category=#{@category}&id=#{@id}"
  'click .result-item.profile': (event, template)-> Router.go "/profile?type=main&user=#{@user}"
  'click .type-tab': (event, template)-> Router.go "/search?type=#{@}", {}, {replaceState: true}

#  'click .type-tab.type-user': -> Router.go "/user/search"

_category2 = null

Template.postList.created = ->
  if @data.lists
    if not _category2
      capCat = s.capitalize @data.category
      _category2 = new ReactiveVar window["#{capCat}Category2Default"]
    setEvents @data.lists

Template.postList.helpers

  title: -> PostCategoryLabel[@category]

  title2: (category, category2)->
    capCat = s.capitalize category
    window["#{capCat}Category2Label"][category2]

  isSelect: (category2)->
    if _category2.get() == category2 then 'selected' else ''

  selectedList: ->
    for list in @lists
      if list.category2 == _category2.get()
        return list

setEvents = (lists)->
  events = {}
  _.each lists, (list)->
    events["click .#{list.category2}"] = ->
      _category2.set list.category2
  Template.postList.events events

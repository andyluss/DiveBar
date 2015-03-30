Template.postList.created = ->
  if @data.lists
    if not Session.get @data.category + 'Category2Current'
      Session.set @data.category + 'Category2Current', getConfigs(@data.category).category2Default
    setEvents @data.lists

Template.postList.helpers

  title: -> PostCategoryLabel[@category]

  title2: (category, category2)->
    capCat = s.capitalize category
    getConfigs(category).category2Label[category2]

  isSelect: (category2)->
    if Session.get(@category + 'Category2Current') == category2 then 'selected' else ''

  selectedList: ->
    for list in @lists
      if list.category2 == Session.get(@category + 'Category2Current')
        return list

setEvents = (lists)->
  events = {}
  _.each lists, (list)->
    events["click .#{list.category}.#{list.category2}"] = ->
      Session.set list.category + 'Category2Current', list.category2
  Template.postList.events events

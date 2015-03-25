@createPostListController = (category, hasCategory2, isMy)->
  capCategory = s.capitalize category
  pluralCapCategory = plural capCategory
  my = isMy and 'My' or ''
  window["#{my}#{capCategory}ListController"] = ContentController.extend
    onAfterAction: ->
      if hasCategory2
        for category2 of window["#{pluralCapCategory}Category2"]
          capCategory2 = s.capitalize category2
          selector = {category2: category2}
          if isMy
            selector = _.extend selector, {owner: Meteor.userId()}
          subManager.subscribe "top#{pluralCapCategory}", Vars["top#{my}#{pluralCapCategory}#{capCategory2}Limit"].get(), selector, -> Vars.loadingMore.set false
      else
        selector = {}
        if isMy
          selector = {owner: Meteor.userId()}
        subManager.subscribe "top#{pluralCapCategory}", Vars["top#{my}#{pluralCapCategory}Limit"].get(), selector, -> Vars.loadingMore.set false
    data: ->
      if hasCategory2
        data = {}
        for category2 of window["#{pluralCapCategory}Category2"]
          capCategory2 = s.capitalize category2
          selector = {category2: category2}
          if isMy
            selector = _.extend selector, {owner: Meteor.userId()}
          data["list#{capCategory2}"] = window[pluralCapCategory].find selector, {sort: {date: -1}}
        return data
      else
        selector = {}
        if isMy
          selector = {owner: Meteor.userId()}
        return {
          list: window[pluralCapCategory].find selector, {sort: {date: -1}}
          category: category
        }

#@createMyPostListController = (category, hasCategory2)->
#  capCategory = s.capitalize category
#  pluralCapCategory = plural capCategory
#  window["My#{capCategory}ListController"] = ContentController.extend
#    onAfterAction: ->
#      subManager.subscribe "top#{pluralCapCategory}", Vars["topMy#{pluralCapCategory}Limit"].get(), {owner: Meteor.userId()}, -> Vars.loadingMore.set false
#    data: ->
#      list: window[pluralCapCategory].find {owner: Meteor.userId()}, {sort: {date: -1}}
#      owner: Meteor.userId()
#      category: category

@createPostUpdaterController = (category)->
  capCategory = s.capitalize category
  pluralCapCategory = plural capCategory
  window["#{capCategory}UpdaterController"] = ContentController.extend
    data: -> window[pluralCapCategory].findOne({_id: @params.id})

@createPostDetailController = (category)->
  capCategory = s.capitalize category
  pluralCapCategory = plural capCategory
  window["#{capCategory}DetailController"] = ContentController.extend
    onAfterAction: ->
      subManager.subscribe category, @params.id
      subManager.subscribe 'favoritesByUser', Meteor.userId()
    data: ->
      window[pluralCapCategory].findOne({_id: @params.id})

@createPostControllers = (category, hasCategory2)->
  list: createPostListController category, hasCategory2
  myList: createPostListController category, hasCategory2, true
  updater: createPostUpdaterController category
  detail: createPostDetailController category
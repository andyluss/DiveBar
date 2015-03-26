@createPostListController = (category, hasCategory2, isMy)->
  capCategory = s.capitalize category
  pcCategory = plural capCategory
  my = isMy and 'My' or ''
  window["#{my}#{capCategory}ListController"] = ContentController.extend
    onAfterAction: ->
      if hasCategory2
        for category2 of window["#{capCategory}Category2"]
          capCategory2 = s.capitalize category2
          selector = {category2: category2}
          if isMy
            selector = _.extend selector, {owner: Meteor.userId(), category2: 'user'}
          subManager.subscribe "top#{pcCategory}", getTopLimit(category, category2, isMy).get(), selector, -> window["loadingMore"].set false
      else
        selector = {}
        if isMy
          selector = {owner: Meteor.userId()}
        subManager.subscribe "top#{pcCategory}", getTopLimit(category, undefined, isMy).get(), selector, -> window["loadingMore"].set false
    data: ->
      if hasCategory2
        data = {}
        data.category = category
        if isMy
          selector = _.extend selector, {owner: Meteor.userId(), category2: 'user'}
          data.list = coln(category).find selector, {sort: {date: -1}}
        else
          data.lists = []
          for category2 of window["#{capCategory}Category2"]
            selector = {category2: category2}
            list = {}
            list.category = category
            list.category2 = category2
            list.list = coln(category).find selector, {sort: {date: -1}}
            data.lists.push list
        return data
      else
        selector = {}
        if isMy
          selector = {owner: Meteor.userId()}
        return {
          list: coln(category).find selector, {sort: {date: -1}}
          category: category
        }

@createPostCreatorController = (category)->
  capCategory = s.capitalize category
  pcCategory = plural capCategory
  window["#{capCategory}CreatorController"] = ContentController.extend
    data: {category: category}

@createPostUpdaterController = (category)->
  capCategory = s.capitalize category
  pcCategory = plural capCategory
  window["#{capCategory}UpdaterController"] = ContentController.extend
    data: -> coln(category).findOne({_id: @params.id})

@createPostDetailController = (category)->
  capCategory = s.capitalize category
  pcCategory = plural capCategory
  window["#{capCategory}DetailController"] = ContentController.extend
    onAfterAction: ->
      subManager.subscribe category, @params.id
      subManager.subscribe 'favoritesByUser', Meteor.userId()
    data: ->
      coln(category).findOne({_id: @params.id})

@createPostControllers = (category, hasCategory2)->
  list: createPostListController category, hasCategory2
  myList: createPostListController category, hasCategory2, true
  creator: createPostCreatorController category
  updater: createPostUpdaterController category
  detail: createPostDetailController category
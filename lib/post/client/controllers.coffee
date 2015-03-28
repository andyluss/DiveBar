@createPostListController = (category, hasCategory2, isMy)->
  capCategory = s.capitalize category
  pcCategory = plural capCategory
  my = isMy and 'My' or ''
  configs = getConfigs category
  gbl()["#{my}#{capCategory}ListController"] = ContentController.extend
    onAfterAction: ->
      if hasCategory2
        for category2 of configs.category2
          capCategory2 = s.capitalize category2
          selector = {category2: category2}
          if isMy
            selector = _.extend selector, {owner: Meteor.userId()}
          subManager.subscribe "top#{pcCategory}", getTopLimit(category, category2, isMy).get(), selector, -> gbl()["loadingMore"].set false
      else
        selector = {}
        if isMy
          selector = {owner: Meteor.userId()}
        subManager.subscribe "top#{pcCategory}", getTopLimit(category, undefined, isMy).get(), selector, -> gbl()["loadingMore"].set false
    data: ->
      data = {}
      data.category = category
      data.isMy = isMy
      if hasCategory2
        if isMy
          selector = {owner: Meteor.userId(), category2: configs.category2My}
          data.list = coln(category).find selector, {sort: {date: -1}}
          data.itemTemplate = configs.itemTemplate[configs.category2My]
        else
          data.lists = []
          for category2 of configs.category2
            selector = {category2: category2}
            list = {}
            list.category = category
            list.category2 = category2
            list.itemTemplate = configs.itemTemplate[category2]
            list.list = coln(category).find selector, {sort: {date: -1}}
            data.lists.push list
      else
        selector = {}
        if isMy
          selector = {owner: Meteor.userId()}
        data.list = coln(category).find selector, {sort: {date: -1}}
        data.itemTemplate = configs.itemTemplate
      return data

@createPostCreatorController = (category)->
  capCategory = s.capitalize category
  pcCategory = plural capCategory
  gbl()["#{capCategory}CreatorController"] = ContentController.extend
    data: {category: category}

@createPostUpdaterController = (category)->
  capCategory = s.capitalize category
  pcCategory = plural capCategory
  gbl()["#{capCategory}UpdaterController"] = ContentController.extend
    data: -> coln(category).findOne({_id: @params.id})

@createPostDetailController = (category)->
  capCategory = s.capitalize category
  pcCategory = plural capCategory
  gbl()["#{capCategory}DetailController"] = ContentController.extend
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
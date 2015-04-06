@createPostViews = (category)->
  newTemplate category, 'list'
  newTemplate category, 'detail'
  newTemplate category, 'creator'
  newTemplate category, 'updater'

newTemplate = (category, type)->
  capType = cap type
  name = category + capType

  if Template[name]
    return

  Template[name] = new Blaze.Template name, ->
    post = "post#{capType}"
    return Template[post]



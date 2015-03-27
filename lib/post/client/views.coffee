@createPostViews = (category)->
  newTemplate category, 'list'
  newTemplate category, 'list', true
  newTemplate category, 'creator'
  newTemplate category, 'updater'
  newTemplate category, 'detail'

newTemplate = (category, type, isMy)->
  capType = cap type
  name = category + capType
  if isMy
    name = 'my' + cap(name)

  if Template[name]
    return

  Template[name] = new Blaze.Template name, ->
    if isMy
      post = "myPost#{capType}"
    else
      post = "post#{capType}"
    Template[post]
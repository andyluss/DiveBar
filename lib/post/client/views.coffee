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

@autoFormOmitFields = (category)->
  omitFields = getConfigs(category).autoFormOmitFields
  if omitFields
    return omitFields
  else
    more = getConfigs(category).moreAutoFormOmitFields or []
    more = _.union(more, postConfigs.autoFormOmitFields)
    return more

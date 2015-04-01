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

@autoFormOmitFields = (category)->
  omitFields = getConfigs(category).autoFormOmitFields
  if omitFields
    return omitFields
  else
    more = getConfigs(category).moreAutoFormOmitFields or []
    more = _.union(more, postConfigs.autoFormOmitFields)
    return more

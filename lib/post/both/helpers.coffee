@autoFormOmitFields = (category)->
  omitFields = getConfigs(category).autoFormOmitFields
  if omitFields
    return omitFields
  else
    more = getConfigs(category).moreAutoFormOmitFields or []
    more = _.union(more, postConfigs.autoFormOmitFields)
    return more

@hasCategory2 = (category)-> getConfigs(category).category2?
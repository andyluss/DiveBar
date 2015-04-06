@autoFormOmitFields = (category)->
  omitFields = getConfigs(category).autoFormOmitFields
  if omitFields
    return omitFields
  else
    more = getConfigs(category).moreAutoFormOmitFields or []
    more = _.union(more, postConfigs.autoFormOmitFields)
    return more

@hasCategory2 = (category)-> getConfigs(category).category2?

@listQueryKey = (key)-> SessionKeys.listQuery + '_' + key

@setPostList = (query)->
  query = currentLocation().queryObject
  _.each query, (value, key)->
    Session.set(listQueryKey key, value)
    query[key] = value
  Router.go(currentLocation().pathname + Url.toQueryString(query))

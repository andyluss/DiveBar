
@postCategoryLabel = (category)-> getConfigs(category).label or ''

@autoFormOmitFields = (category)->
  omitFields = getConfigs(category).autoFormOmitFields
  if omitFields
    return omitFields
  else
    more = getConfigs(category).moreAutoFormOmitFields or []
    more = _.union(more, postConfigs.autoFormOmitFields)
    return more

@hasCategory2 = (category)-> getConfigs(category).category2?

@fillDefaultCategory2 = (queryObject, category2)->
  category = queryObject?.category
  if not category
    return false
  if hasCategory2 category and not queryObject.category2?
    queryObject.category2 = category2
  return queryObject

@checkCategory2 = (queryObject)->
  qo = queryObject
  if not hasCategory2(qo.category)
    return qo
  category2s = getConfigs(qo.category).category2
  if (qo.category2 is category2s.official) or (not qo.category2?)
    qo.category2 = amIAdmin() and category2s.official or category2s.user
  return qo

@checkPostRouteLocation = (location)->
  qo = checkCategory2 location.queryObject
  return location.pathname + Iron.Url.toQueryString(qo)

@listQueryKey = (key)-> SessionKeys.listQuery + '_' + key

@setPostList = (query)->
  query = currentLocation().queryObject
  _.each query, (value, key)->
    Session.set(listQueryKey key, value)
    query[key] = value
  Router.go(currentLocation().pathname + Url.toQueryString(query))

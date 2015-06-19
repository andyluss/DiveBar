
Meteor.startup ->
  initSchemas()
  initQiniu()
  initEasySearch()

initSchemas = ->
  initPostSchema()
  initNoteSchema()
  initJourneySchema()
  initProductSchema()
  initSaySchema()
  initCertificateSchema()

initQiniu = ->
  qiniuConfig.BUCKET = 'divebar'
  qiniuConfig.DOMAIN = 'http://7xicv5.com1.z0.glb.clouddn.com/'

initEasySearch = ->
  createSearchIndex 'note'
  createSearchIndex 'journey'
  createSearchIndex 'product'
  createSearchIndex 'say'

createSearchIndex = (category)->
  EasySearch.createSearchIndex pcap(category),
    field: ['title']
    returnFields: ['title', '_id', 'category']
    collection: Posts
    limit: 20
    use: 'mongo-db'
    query: (searchString, opts)->
      # Default query that is used for searching
      query = EasySearch.getSearcher(@use).defaultQuery(@, searchString);
      query.category = category
      return query

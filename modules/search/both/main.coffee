Meteor.startup ->

  _.each PostCategory, (category)->
    createPostSearchIndex category

  EasySearch.createSearchIndex 'profiles',
    field: ['nickname', 'user']
    collection: Profiles
    limit: 20
    use: 'mongo-db'

createPostSearchIndex = (category)->
  EasySearch.createSearchIndex plural(category),
    field: ['title', '_id', 'category']
    collection: coln(category)
    limit: 20
    use: 'mongo-db'
Meteor.startup ->

  _.each PostCategory, (category)->
    createPostSearchIndex category

createPostSearchIndex = (category)->
  EasySearch.createSearchIndex plural(category),
    field: ['title']
    returnFields: ['title', '_id', 'category']
    collection: coln(category)
    limit: 20
    use: 'mongo-db'
@createPostCountMethod = (name)->
  capName = s.capitalize name
  pluralCapName = plural capName
  methods = {}
  methods["#{name}Count"] = (selector)->
    gbl()[pluralCapName].find(selector).count()
  Meteor.methods methods
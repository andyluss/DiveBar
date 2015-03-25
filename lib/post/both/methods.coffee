@createPostCountMethod = (name)->
  capName = s.capitalize name
  pluralCapName = plural capName
  methods = {}
  methods["#{name}Count"] = (owner)->
    selector = owner and {owner: owner} or {}
    gg = Meteor.isClient and window or global
    gg[pluralCapName].find(selector).count()
  Meteor.methods methods
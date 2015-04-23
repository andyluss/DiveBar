Meteor.startup ->
  Houston.add_collection Users
  Houston.add_collection Houston._admins

  Houston.add_collection Favorites
  Houston.add_collection Comments._collection


Meteor.startup ->
  Houston.add_collection Users
  Houston.add_collection Houston._admins

  global['Favorites'] and Houston.add_collection Favorites
  global['Comments'] and Houston.add_collection Comments._collection


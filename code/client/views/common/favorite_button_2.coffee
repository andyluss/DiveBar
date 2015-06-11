Template.favoriteButton2.events
  'click': (event,template) ->
    if not myId()
      return
    fav = Favorites.findOne({doc: @doc, user: myId()})
    if fav
      Favorites.remove {_id: fav._id}
    else
      Favorites.insert
        doc: @doc
        user: Meteor.userId()
        category: @category
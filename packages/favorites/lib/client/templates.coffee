Template.favoriteButton.helpers
  isFavorite: (_id) ->
    Favorites.findOne
      doc: _id
      user: Meteor.userId()

Template.favoriteButtonNotFavorited.events
  'click .favorite-button': (e,t) ->
    Favorites.insert
      doc: $(e.currentTarget).attr('doc')
      user: Meteor.userId()
      category: $(e.currentTarget).attr('category')

Template.favoriteButtonFavorited.events
  'click .favorite-button': (e,t) ->
    favorite = Favorites.findOne
      user: Meteor.userId()
      doc: $(e.currentTarget).attr('doc')
    Favorites.remove
      _id: favorite._id
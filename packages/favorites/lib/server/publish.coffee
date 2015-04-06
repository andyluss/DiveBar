Meteor.publish 'favorites', ->
	Favorites.find()

Meteor.publish 'favoritesByUser', (_id) ->
	Favorites.find {user: _id}
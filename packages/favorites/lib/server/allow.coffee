Favorites.allow
	insert: (userId, doc) ->
		doc.user == userId
	remove: (userId, doc) ->
		doc.user == userId
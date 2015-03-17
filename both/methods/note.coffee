
Meteor.methods
  noteCount: (owner)->
    selector = if owner? then {owner: owner} else {}
    Notes.find(selector).count()

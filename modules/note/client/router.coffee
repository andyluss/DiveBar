Router.route '/note/list',
  name: 'note.list'

Router.route '/note/creator',
  name: 'note.creator'

Router.route '/note/updater/:id',
  name: 'note.updater'
  data: ->
    Notes.findOne({_id: @params.id})

Router.route '/note/detail/:id',
  name: 'note.detail'





Router.route '/my/note/list',
  name: 'my.note.list'

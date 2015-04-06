Template.ionNavBar.events

  'click [data-action=skip-login]': (event, template)->
    Router.go "/post/list?category=#{PostCategory.note}"


title = new ReactiveVar('登录')
Template.login.helpers
  inLoginRoute: ->
    
  title: -> title.get()

Template.login.events
  'click #at-signUp': ->
    title.set('注册')
  'click #at-signIn': ->
    title.set('登陆')
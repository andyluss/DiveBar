Template.ionNavBar.events
  'click [data-action=skip-sign-in]': (event, template)->
    Router.go "/post/list?category=#{PostCategory.note}"

Template.signIn.helpers
  fromOther: -> currentRoute() != 'signIn' or currentRouteQuery().from
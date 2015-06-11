Template.journeyListItemUser.events

  'click': -> Router.go "/post/detail?category=#{@category}&id=#{@_id}"

  'click .user-bar': (event)->
    event.stopImmediatePropagation()
    Router.go userUrl(@user)

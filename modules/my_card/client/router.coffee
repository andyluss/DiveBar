ensureSignedInRoute = []
ensureSignedInRoute.push 'my.card'

routeCardInfo = (type)->
  ensureSignedInRoute.push "my.card.#{type}"
  Router.route '/my/card/' + type,
    controller: 'MyCardController'

Router.route '/my/card',
  progress : false

routeCardInfo 'nickname'
routeCardInfo 'location'
routeCardInfo 'qq'
routeCardInfo 'wechat'
routeCardInfo 'mobile'
routeCardInfo 'signature'
routeCardInfo 'qr'

Router.plugin('ensureSignedIn', {
  only: ensureSignedInRoute
});
routeCardInfo = (type)->
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


Router.plugin('ensureSignedIn', {
  only: ['my.card']
});
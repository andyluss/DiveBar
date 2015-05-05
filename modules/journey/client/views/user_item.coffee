Template.journeyUserItem.events
  'click .title-container': -> Router.go "/post/detail?category=#{@category}&id=#{@_id}"
  'click .under-box': -> Router.go "/post/detail?category=#{@category}&id=#{@_id}"
Meteor.methods
  uptoken: ->
    returnBody = '{
      "hash": $(etag),
      "key": $(key),
      "width": $(imageInfo.width),
      "height": $(imageInfo.height)
    }'
    policy = new qiniuServer.rs.PutPolicy(qiniuConfig.BUCKET, null, null, null, returnBody)
    return policy.token()

  uploadToQiniu: (params)->
    qiniuServer.io.put params.token, params.key, params.body, null, (err, ret)->
      if err
        console.log err
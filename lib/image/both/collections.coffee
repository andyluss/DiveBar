createThumb = (fileObj, readStream, writeStream)->
  size = '96'
  gm readStream
    .autoOrient()
    .resize size, size + '^'
    .gravity 'Center'
    .extent size, size
    .stream 'PNG'
    .pipe writeStream

@Images = new FS.Collection 'images',
  stores: [
    new FS.Store.FileSystem ImageStores.thumbs,
      beforeWrite: (fileObj)->
        extension: 'png'
        type: 'image/png'
      transformWrite: createThumb

    new FS.Store.FileSystem ImageStores.images,
      transformWrite: (fileObj, readStream, writeStream)->
        # read image dimensions and write to metadata
        gm readStream
          .size FS.Utility.safeCallback (err, size)->
            if err
              console.log err
            else
              fileObj.update
                $set:
                  'metadata.width': size.width
                  'metadata.height': size.height
          .stream()
          .pipe writeStream
  ]

  filter:
    maxSize: 1048576
    allow:
      contentTypes: ['image/*']

    onInvalid: (message)->
      if Meteor.isClient
        alert message
      else
        console.log message
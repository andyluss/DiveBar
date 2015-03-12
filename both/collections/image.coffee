createThumb = (fileObj, readStream, writeStream)->
  size = '96';
  gm(readStream).autoOrient().resize(size, size + '^').gravity('Center').extent(size, size)
    .stream('PNG').pipe(writeStream);

@Images = new FS.Collection 'images',
  stores: [
    new FS.Store.FileSystem "thumbs",
      beforeWrite: (fileObj)->
        extension: 'png'
        type: 'image/png'
      transformWrite: createThumb

    new FS.Store.FileSystem 'images'
  ]

  filter: {
    maxSize: 1048576
    allow:
      contentTypes: ['image/*']

    onInvalid: (message)->
      if Meteor.isClient
        alert message
      else
        console.log message
  }
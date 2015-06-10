
@initNoteSchema = ->

  moreSchema =
    date:
      type: Date
      label: '日期'
      optional: true
      autoValue: ->
        if @isInsert
          new Date()

    location:
      type: String
      label: '地点'
      optional: true
      max: 100
      autoform:
        placeholder: '地点...'

  Schemas.note = new SimpleSchema [Schemas.post, moreSchema]
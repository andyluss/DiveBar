creator = (value)->
  if value
    Session.set 'creator', value
  else
    Session.get 'creator'

formId = (category)-> "#{category}InsertForm"

Template.postCreator.onCreated ->
  creator newImageCreator()
  createAutoFormHooks @data.category

Template.postCreator.helpers
  creator: creator
  formCollection: -> coln @category
  formId: -> formId @category
  label: -> getConfigs(@category).label
  formOmitFields: ->
    autoFormOmitFields(@category)

createAutoFormHooks = (category)->
  check category, String
  hooks =
    onSuccess: -> back()
    before:
      insert: (doc)->
        doc.creator = creator()
        return doc
  AutoForm.addHooks formId(category), hooks, true


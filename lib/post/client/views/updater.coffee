formId = (category)-> "#{category}UpdateForm"

Template.postUpdater.onCreated ->
  createAutoFormHooks @data.category

Template.postUpdater.helpers
  formCollection: -> coln @category
  formId: -> formId @category
  label: -> getConfigs(@category).label
  formOmitFields: ->
    autoFormOmitFields(@category)

createAutoFormHooks = (category)->
  check category, String
  hooks =
    onSuccess: -> back()
  AutoForm.addHooks formId(category), hooks, true



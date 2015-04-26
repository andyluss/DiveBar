formId = (category)-> "#{category}UpdateForm"

Template.postUpdater.onRendered ->
  createAutoFormHooks @data

Template.postUpdater.helpers
  formCollection: -> coln @category
  formId: -> formId @category
  label: -> getConfigs(@category).label
  formOmitFields: -> autoFormOmitFields(@category)

createAutoFormHooks = (data)->
  hooks =
    onSuccess: (formType, result)->
      coln(data.category).update {_id: @docId}, {$set: {images: data.imagesToUpload.array()}}
      back()
  AutoForm.addHooks formId(data.category), hooks, true



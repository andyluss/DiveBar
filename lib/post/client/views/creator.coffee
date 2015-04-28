formId = (category)-> "#{category}InsertForm"

Template.postCreator.onRendered ->
  createAutoFormHooks @data

Template.postCreator.helpers
  formCollection: -> coln @category
  formId: -> formId @category
  label: -> getConfigs(@category).label
  formOmitFields: -> autoFormOmitFields(@category)

createAutoFormHooks = (data)->
  hooks =
    onSuccess: (formType, result)->
      coln(data.category).update {_id: @docId},
        $set:
          category2: data.category2
          images: data.imagesToUpload.array()
      back()
  AutoForm.addHooks formId(data.category), hooks, true


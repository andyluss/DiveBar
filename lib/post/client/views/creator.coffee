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
    before:
      insert: (doc)->
        doc.category2 = data.category2
        return doc
    onSuccess: (formType, result)->
      coln(data.category).update {_id: @docId},
        $set:
          images: data.imagesToUpload.array()
      back()
  AutoForm.addHooks formId(data.category), hooks, true


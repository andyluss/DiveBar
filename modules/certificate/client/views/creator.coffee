formId = -> "certificateInsertForm"

Template.certificateCreator.onRendered ->
  createAutoFormHooks @data

Template.certificateCreator.helpers
  formCollection: -> Certificates
  formId: -> formId()
  formOmitFields: -> ["createdAt", "updatedAt", "user", "images"]

createAutoFormHooks = (data)->
  hooks =
    onSuccess: (formType, result)->
      Certificates.update {_id: @docId},
        $set:
          images: data.imagesToUpload.array()
      back()
  AutoForm.addHooks formId(), hooks, true


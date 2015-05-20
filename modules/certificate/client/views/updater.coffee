formId = -> "certificateUpdateForm"

Template.certificateUpdater.onRendered ->
  createAutoFormHooks @data

Template.certificateUpdater.helpers
  formCollection: -> Certificates
  formId: -> formId()
  formOmitFields: -> ["createdAt", "updatedAt", "user", "images"]

createAutoFormHooks = (data)->
  hooks =
    onSuccess: (formType, result)->
      Certificates.update {_id: @docId}, {$set: {images: data.imagesToUpload.array()}}
      back()
  AutoForm.addHooks formId(), hooks, true



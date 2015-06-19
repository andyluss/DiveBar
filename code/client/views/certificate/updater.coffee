formId = -> "certificateUpdateForm"

Template.certificateUpdater.onRendered ->
  createAutoFormHooks @data
  @find('.quick-form .form-group:first-child .form-control').focus()

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



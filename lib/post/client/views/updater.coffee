formId = (category)-> "#{category}UpdateForm"

Template.postUpdater.onCreated ->
  createAutoFormHooks @data.category

Template.postUpdater.helpers
  formCollection: -> coln @category
  formId: -> formId @category
  label: -> PostCategoryLabel[@category]
  formOmitFields: ->
    autoFormOmitFields(@category)

createAutoFormHooks = (category)->
  check category, String
  hooks =
    onSuccess: -> back()
    before:
      update: (doc)->
        pictures = []
        pictures.push image._id for image in imagesUploaded(@currentDoc.creator).fetch()
        doc['$set'].pictures = pictures # TODO Can improve
        return doc
  AutoForm.addHooks formId(category), hooks, true



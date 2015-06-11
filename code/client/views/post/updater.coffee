autoFormOmitFields = ["category", "category2", "createdAt", "updatedAt", "user", "images", "viewCount"]

formId = (category)-> "#{category}UpdateForm"

Template.postUpdater.onRendered ->
  createAutoFormHooks @data

Template.postUpdater.helpers
  formSchema: -> Schemas[@category]
  formId: -> formId @category
  label: -> getConfigs(@category).label
  formOmitFields: -> autoFormOmitFields

createAutoFormHooks = (data)->
  hooks =
    onSuccess: (formType, result)->
      Posts.update {_id: @docId}, {$set: {images: data.imagesToUpload.array(), updatedAt: new Date()}}
      back()
      $('[data-nav-container]').addClass 'nav-view-direction-back'
      $('[data-navbar-container]').addClass 'nav-bar-direction-back'
  AutoForm.addHooks formId(data.category), hooks, true



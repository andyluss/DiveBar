autoFormOmitFields = ["category", "category2", "createdAt", "updatedAt", "user", "images", "viewCount"]

formId = (category)-> "#{category}InsertForm"

Template.postCreator.onRendered ->
  createAutoFormHooks @data

Template.postCreator.helpers
  formSchema: -> Schemas[@category]
  formId: -> formId @category
  label: -> getConfigs(@category).label
  formOmitFields: -> autoFormOmitFields

createAutoFormHooks = (data)->
  hooks =
    before:
      insert: (doc)->
        doc.user = myId()
        doc.createdAt = new Date()
        doc.category = data.category
        doc.category2 = data.category2
        doc.viewCount = 0
        return doc
    onSuccess: (formType, result)->
      Posts.update {_id: @docId},
        $set:
          images: data.imagesToUpload.array()
      back()
      $('[data-nav-container]').addClass 'nav-view-direction-back'
      $('[data-navbar-container]').addClass 'nav-bar-direction-back'
  AutoForm.addHooks formId(data.category), hooks, true


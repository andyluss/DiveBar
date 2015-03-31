creator = (value)->
  if value
    Session.set 'creator', value
  else
    Session.get 'creator'

formId = (category)-> "#{category}InsertForm"

Template.postCreator.onCreated ->
  creator newImageCreator()
  createAutoFormHooks @data.category

Template.postCreator.helpers
  creator: creator
  formCollection: -> coln @category
  formId: -> formId @category
  label: -> PostCategoryLabel[@category]

createAutoFormHooks = (category)->
  check category, String
  hooks =
    onSuccess: -> back()
    before:
      insert: (doc)->
        pictures = []
        pictures.push image._id for image in imagesUploaded(creator()).fetch()
        doc.pictures = pictures
        doc.creator = creator()
        console.log(doc)
        return doc
  AutoForm.addHooks formId(category), hooks, true


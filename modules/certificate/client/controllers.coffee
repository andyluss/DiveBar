@CertificateListController = ContentController.extend
  onAfterAction: ->
    selector = pq(@)
    subsManager.subscribe "certificateList", selector
  data: ->
    selector = pq(@)
    data = _.clone selector
    data.list = Certificates.find selector, {sort: {date: -1}}
    return data

@CertificateDetailController = ContentController.extend
  onAfterAction: -> subsManager.subscribe 'certificate', pq(@).id
  data: -> Certificates.findOne({_id: pq(@).id})

@CertificateCreatorController = ContentController.extend
  data: -> pq(@)

@CertificateUpdaterController = ContentController.extend
  data: -> Certificates.findOne({_id: pq(@).id})

pq = (context)-> paramsQuery context


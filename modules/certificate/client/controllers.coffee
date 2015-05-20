@CertificateListController = ContentController.extend
  onAfterAction: ->
    selector = pq(@)
    subManager.subscribe "certificateList", selector
  data: ->
    selector = pq(@)
    data = _.clone selector
    data.list = Certificates.find selector, {sort: {date: -1}}
    return noTransition data

@CertificateDetailController = ContentController.extend
  onAfterAction: -> subManager.subscribe 'certificate', pq(@).id
  data: -> noTransition Certificates.findOne({_id: pq(@).id})

@CertificateCreatorController = ContentController.extend
  data: -> noTransition pq(@)

@CertificateUpdaterController = ContentController.extend
  data: -> noTransition Certificates.findOne({_id: pq(@).id})

pq = (context)-> paramsQuery context


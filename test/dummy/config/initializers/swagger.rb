GrapeSwaggerRails.options.app_name = 'auth_engine'
GrapeSwaggerRails.options.url      = '/api/v1/doc.json'
GrapeSwaggerRails.options.app_url  = 'http://localhost:3000'
GrapeSwaggerRails.options.before_filter_proc = proc {
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port
}
GrapeSwaggerRails.options.doc_expansion = 'list'

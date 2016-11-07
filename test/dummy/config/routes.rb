Rails.application.routes.draw do
  #mount AuthEngine::Engine => "/auth_engine"
  mount AuthEngine::Base => '/api'
  mount GrapeSwaggerRails::Engine => 'api/documentation'
end

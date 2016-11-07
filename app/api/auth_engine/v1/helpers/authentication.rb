module AuthEngine
  module V1
    module Helpers
      module Authentication
        extend Grape::API::Helpers

        attr_accessor :current_person

        def authenticate_token!
          error!('Invalid API token', 401) unless token
          @current_person = person_from_token
          error!('Invalid API token', 401) unless @current_person
        rescue ::JWT::ExpiredSignature
          error!('Expired API token', 401)
        rescue ::JWT::DecodeError
          error!('Invalid API token', 401)
        rescue ActiveRecord::RecordNotFound
          error!('Invalid API token', 401)
        end

        def token
          env['HTTP_AUTHORIZATION'].to_s.split(' ').last
        end

        def person_from_token
          Knock::AuthToken.new(token: token)
            .entity_for(AuthEngine::Credential)
            .user
        end
      end
    end
  end
end
module AuthEngine
  module V1
    module Helpers
      module AuthToken
        extend Grape::API::Helpers

        def authenticate_credentials!
          unless credential.authenticate(auth_params[:password])
            error!('Invalid Credentials', 401)
          end
        rescue ActiveRecord::RecordNotFound
          error!('Invalid Credentials', 401)
        end

        def auth_token
          Knock::AuthToken.new payload: { sub: credential.id }
        end

        def credential
          AuthEngine::Credential.find_by!(email: auth_params[:email])
        end

        def auth_params
          declared(params, include_missing: false)[:auth]
        end
      end
    end
  end
end

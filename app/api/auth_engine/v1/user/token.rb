module AuthEngine
  module V1
    module User
      class Token < Grape::API
        include V1::Defaults

        helpers V1::Helpers::AuthToken

        after_validation do
          authenticate_credentials!
        end

        params do
          requires :auth, type: Hash do
            requires :email, type: String
            requires :password, type: String
          end
        end
        desc 'Create an auth token'

        post '/token' do
          { jwt: auth_token.token }
        end
      end
    end
  end
end

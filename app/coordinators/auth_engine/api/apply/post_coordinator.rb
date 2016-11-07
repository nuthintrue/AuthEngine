module AuthEngine
  module Api
    module Apply
      class PostCoordinator < Api::ApiCoordinator

        def call
          user = AuthEngine::User.create!(first_name: params[:first_name], last_name: params[:last_name]) #
          credential = user.create_credential(email: params[:email], password: params[:password])
          verify_credential!(credential)
          user.save!

          result.status = 201
          result.body = 'account created!'
          result
        rescue V1::Error::ApiError => e
          result.status = e.status
          result.body = e.message
          result
        end

        private

        def verify_credential!(credential)
          if credential.invalid?
            if credential.errors.messages.key?(:email) &&
              credential.errors.messages[:email].include?('has already been taken')
              raise_api_error!('Email is invalid, please try a new one.', 409, credential.errors.messages)
            else
              raise_api_error!('User information is invalid!', 422, credential.errors.messages)
            end
          end
        end
      end
    end
  end
end


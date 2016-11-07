module AuthEngine
  module Api
    module Health
      class PostCoordinator < Api::ApiCoordinator

        def call
          result.status = 200
          result.body = 'Success! The service is healthy!'
          result
        rescue StandardError => e
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


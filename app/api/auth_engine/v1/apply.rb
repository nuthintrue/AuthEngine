module AuthEngine
  module V1
    class Apply < Grape::API
      include V1::Defaults

      namespace :apply do
        params do
          requires :email, type: String
          requires :password, type: String
          optional :first_name, type: String
          optional :last_name, type: String
          optional :mobile_phone_number, type: String
        end

        post do

          result = AuthEngine::Api::Apply::PostCoordinator.new(params: permitted_params, headers: headers).call

          status result.status
          result.body
        end


      end
    end
  end
end


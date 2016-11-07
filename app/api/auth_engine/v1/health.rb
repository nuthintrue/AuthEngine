module AuthEngine
  module V1
    class Health < Grape::API
      include V1::Defaults

      helpers V1::Helpers::Authentication

      before do
        authenticate_token!
      end
      namespace :health do
        desc 'headers', {
          headers:
            { "Authorization" => { description: "JWT Token", required: true } }
        }
        get :health do

          status 200
          "OK"
        end
      end
    end
  end
end

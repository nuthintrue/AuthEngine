module AuthEngine
  module V1
    module User
      class Root < Grape::API
        namespace :user do
          mount ::V1::User::Token
          mount ::V1::User::Me
        end
      end
    end
  end
end
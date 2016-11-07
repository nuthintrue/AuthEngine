module AuthEngine
  module V1
    class Base < Grape::API
      mount V1::Health
      mount V1::Apply
      mount V1::User::Token

      add_swagger_documentation mount_path: '/v1/doc',
        api_version: 'v1',
        info: {
          title: "auth api",
          description: "auth api",
          contact_name: "auth api"
        }
    end
  end
end
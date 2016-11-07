module AuthEngine
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do
        # Common Grape settings
        version 'v1'
        format :json

        # Common helpers
        helpers do
          def permitted_params
            @permitted_params ||= declared(params, include_missing: false)
          end
        end
      end
    end
  end
end
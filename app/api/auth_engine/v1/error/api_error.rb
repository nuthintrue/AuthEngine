module AuthEngine
  module V1
    module Error
      class ApiError < StandardError
        attr_reader :data, :message, :status, :code

        def initialize(status:, message:, data: nil, code: nil)
          @status = status
          @message = message
          @data = data
          @code = code
        end
      end
    end
  end
end

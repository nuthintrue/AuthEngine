module AuthEngine
  class BaseCoordinator
    def raise_api_error!(message, status, data = nil, code = nil)
      raise V1::Error::ApiError, status: status, message: message, data: data, code: code
    end
  end
end
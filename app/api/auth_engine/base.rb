module AuthEngine
  class Base < Grape::API
    mount V1::Base
  end
end
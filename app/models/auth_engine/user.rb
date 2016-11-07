module AuthEngine
  class User < ApplicationRecord
    has_one :credential
    delegate :email, to: :credential
  end
end

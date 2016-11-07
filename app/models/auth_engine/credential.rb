module AuthEngine
  class Credential < ApplicationRecord
    has_secure_password

    validates :email, uniqueness: true
    validates :password, length: { minimum: 6 }, if: :setting_password?
    belongs_to :user

    def generate_new_confirmation_token
      self.update_attributes(confirmation_token_expires_at: new_confirmation_token_expires_at, confirmation_token: new_confirmation_token)
    end

    def confirmation_token_expired?
      Time.current >= confirmation_token_expires_at
    end

    private

    def setting_password?
      password.present?
    end

    def new_confirmation_token
      self.confirmation_token = SecureRandom.urlsafe_base64
    end

    def new_confirmation_token_expires_at
      self.confirmation_token_expires_at = Time.current + 1.day
    end
  end
end

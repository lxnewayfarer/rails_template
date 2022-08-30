# frozen_string_literal: true

# Module implements JWT authentication
module Authenticate
  def authenticate!
    token = headers['Authorization']&.split&.last
    payload, _metadata = ::JWT.decode(token, Rails.application.secret_key_base, true, algorithm: 'HS256')
    payload.deep_symbolize_keys!

    # You may want to set expiring token, use :issued_at from payload
    @current_user = User.find(payload[:user_id])
  end
end

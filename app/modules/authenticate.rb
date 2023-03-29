# frozen_string_literal: true

# Module implements JWT authentication
module Authenticate
  # This methods allows you to authenticate and get @current_user
  def authenticate!
    token = headers['Authorization']&.split&.last
    payload, _metadata = ::JWT.decode(token, Rails.application.secret_key_base, true, algorithm: 'HS256')
    payload.deep_symbolize_keys!

    # You may want to set expiring token, use :issued_at from payload
    @current_user = User.find(payload[:user_id])
  end

  # Call this method for private routes. Checking authorization header and compairing with ENV variable
  def private_authenticate!
    token = headers['Authorization']&.split&.last

    error!('Access Denied', 401) unless token == ENV['PRIVATE_TOKEN']
  end
end

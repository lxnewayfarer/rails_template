# frozen_string_literal: true

##
# Generate JWT
#
module JwtInteractions
  class Encode < ActiveInteraction::Base
    hash :payload do
      string :user_id
    end

    def execute
      payload[:exp] ||= 27.days.from_now.to_i
      payload[:issued_at] = Time.now.to_i

      JWT.encode(payload, Rails.application.secret_key_base, 'HS256')
    end
  end
end

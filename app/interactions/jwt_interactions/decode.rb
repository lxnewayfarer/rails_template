# frozen_string_literal: true

##
# Decode JWT
#
module JwtInteractions
  class Decode < ActiveInteraction::Base
    string :token

    def execute
      decoded = JWT.decode(token, Rails.application.secret_key_base)[0]

      HashWithIndifferentAccess.new decoded
    end
  end
end

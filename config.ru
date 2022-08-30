# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
require 'rack/cors'

use Rack::Cors do
  allow do
    origins '*'
    resource '/api/*', headers: :any,
                       methods: %i[get post update delete options put patch],
                       expose: %w[X-Page X-Total X-Per-Page Content-Disposition]
  end
  allow do
    origins '*'
    resource '*', headers: :any,
                  methods: %i[get post update delete options put patch],
                  expose: %w[X-Page X-Total X-Per-Page Content-Disposition]
  end
end

run Rails.application

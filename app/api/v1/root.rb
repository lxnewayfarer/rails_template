# frozen_string_literal: true

require 'grape-swagger'

module V1
  class Root < Grape::API
    include Authenticate

    helpers do
      include Authenticate
    end

    namespace :v1 do
      format :json

      mount V1::PublicRoutes
    end

    # Check private Authorization token
    before do
      private_authenticate!
    end

    # Adding swagger documentation to /api/swagger_doc.json
    add_swagger_documentation
  end
end

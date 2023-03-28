# frozen_string_literal: true

require 'grape-swagger'

module V1
  class Root < Grape::API
    namespace :v1 do
      format :json

      mount V1::PublicRoutes
    end

    add_swagger_documentation(
      api_version: '1.0',
      doc_version: '1.0',
      api_documentation: { desc: 'Auto generated Swagger API documentation' },
      info: {
        title: 'API',
        description: 'A description of the API.'
      },
      security_definitions: {
        api_key: {
          type: :apiKey,
          name: :Authorization,
          in: :header
        },
        app_key: {
          type: :apiKey,
          name: :Authorization,
          in: :header
        }
      }
    )
  end
end

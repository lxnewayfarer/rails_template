# frozen_string_literal: true

# Swagger engine initializer

GrapeSwaggerRails.options.url = '/api/swagger_doc.json'

GrapeSwaggerRails.options.api_key_name = 'Authorization'
GrapeSwaggerRails.options.api_key_type = 'header'
GrapeSwaggerRails.options.api_key_default_value = ENV['PRIVATE_TOKEN']

GrapeSwaggerRails.options.before_action do
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port
end

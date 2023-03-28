# frozen_string_literal: true

require 'grape-swagger'

module V1
  class Root < Grape::API
    namespace :v1 do
      format :json

      mount V1::PublicRoutes
    end

    add_swagger_documentation
  end
end

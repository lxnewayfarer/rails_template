# frozen_string_literal: true

module V1
  class Root < Grape::API
    namespace :v1 do
      format :json

      mount V1::PublicRoutes
    end
  end
end

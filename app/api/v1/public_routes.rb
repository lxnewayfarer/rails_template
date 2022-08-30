# frozen_string_literal: true

module V1
  class PublicRoutes < Grape::API
    namespace :public do
      mount Public::Users
    end
  end
end

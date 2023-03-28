# frozen_string_literal: true

module V1
  class PublicRoutes < Grape::API
    namespace :public do
      resource :users do
        mount Public::UserResources::SignUp
        mount Public::UserResources::SignIn
      end
    end
  end
end

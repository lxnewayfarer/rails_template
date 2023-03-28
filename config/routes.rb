# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount API => '/api'
  authenticate :admin_user do
    mount GrapeSwaggerRails::Engine => '/swagger'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

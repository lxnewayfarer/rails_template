# frozen_string_literal: true

# This will guess the User class
FactoryBot.define do
  factory :user do
    email { 'email@example.com' }
    password { 'password' }
  end
end

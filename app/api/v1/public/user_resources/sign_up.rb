# frozen_string_literal: true

module V1
  module Public
    module UserResources
      # Sign up for users
      class SignUp < Grape::API
        desc 'Create a user'
        params do
          requires :email, type: String
          requires :password, type: String
          requires :password_confirmation, type: String
        end
        post 'sign_up' do
          user = User.create({
                               email: params[:email],
                               password: params[:password],
                               password_confirmation: params[:password_confirmation]
                             })
          error!('400 Invalid user', 400) unless user.valid?

          { success: true }
        end
      end
    end
  end
end

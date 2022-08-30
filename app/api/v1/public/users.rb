# frozen_string_literal: true

module V1
  module Public
    # Users API
    class Users < Grape::API
      resource :users do
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

        desc 'Sign In'
        params do
          requires :email, type: String
          requires :password, type: String
        end

        post 'sign_in' do
          user = User.find_by_email(params[:email])
          if user&.valid_password?(params[:password])
            JWT.encode({ user_id: user.id, issued_at: DateTime.now.to_i }, Rails.application.secret_key_base, 'HS256')
          else
            error!('403 Forbidden', 403)
          end
        end
      end
    end
  end
end

# frozen_string_literal: true

module V1
  module Public
    module UserResources
      # Sign in for users and return JWT token which allows to authenticate user
      class SignIn < Grape::API
        desc 'Sign In'
        params do
          requires :email, type: String
          requires :password, type: String
        end

        post 'sign_in' do
          user = User.find_by(email: params[:email])
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

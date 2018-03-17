# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    respond_to do |format|
      format.html { super }
      format.json do
        @user = User.find_by(email: params[:email])

        if @user && @user.valid_password?(params[:password])
          sign_in @user

          render json: current_user
        else
          render json: { error: 'User with this credentials not found' }, status: 404
        end
      end
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def check_access_for_unauthorized
    redirect_to schools_path if user_signed_in?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:description])
  end

  def validate_recruiter_user
    unless current_user.recruiter?
      respond_to do |format|
        format.html { redirect_to contests_path }
        format.json do
          render json: {
            errors: 'You should be a recruiter in order to access this page'
          }
        end
      end
    end
  end

  def validate_contestant_user
    unless current_user.contestant?
      respond_to do |format|
        format.html { redirect_to contest_submissions_path }
        format.json do
          render json: {
            errors: 'You should be a contestant in order to access this page'
          }
        end
      end
    end
  end
end

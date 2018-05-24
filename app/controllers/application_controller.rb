class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def get_link_to_object_by_user(user)
    if user.contestant?
      contestant_path Contestant.joins(:user).where(users: { id: user.id }).last
    elsif user.recruiter?
      recruiter_path Recruiter.joins(:user).where(users: { id: user.id }).last
    elsif user.school?
      school_path School.joins(:user).where(users: { id: user.id }).last
    end
  end
  helper_method :get_link_to_object_by_user

  protected

  def check_access_for_unauthorized
    redirect_to schools_path if user_signed_in?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:description])
  end
end

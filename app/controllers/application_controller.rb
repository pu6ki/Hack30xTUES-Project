class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protected

  def check_access_for_unauthorized
    redirect_to schools_path if user_signed_in?
  end
end

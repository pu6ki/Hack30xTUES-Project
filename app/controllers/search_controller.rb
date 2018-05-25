class SearchController < ApplicationController
  acts_as_token_authentication_handler_for User

  def index
    @contests = Contest.search search_params
    @schools = School.search search_params
    @recruiters = Recruiter.search search_params
  end

  def search_params
    params.permit(:term)
  end
end

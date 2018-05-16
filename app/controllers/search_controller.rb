class SearchController < ApplicationController
  def index
    @contests = Contest.search search_params
    @schools = School.search search_params
    @recruiters = Recruiter.search search_params
  end

  def search_params
    params.require(:term)
  end
end

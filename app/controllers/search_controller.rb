class SearchController < ApplicationController
  def index
    @contests = Contest.search(params[:term])
    @schools = School.search(params[:term])
    @recruiters = Recruiter.search(params[:term])
  end
end

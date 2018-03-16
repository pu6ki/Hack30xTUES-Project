class RecruitersController < ApplicationController
  # before_action :authenticate_user!, only: [:index, :show]
  before_action :set_recruiter, only: [:show]

  def index
    @recruiters = Recruiter.all
  end

  def show
  end

  def create
    @recruiter = Recruiter.new recruiter_params

    if @recruiter.save
      puts 'Recruiter valid'
    else
      puts @recruiter.errors.full_messages
    end
  end

  private

  def set_recruiter
    @recruiter = Recruiter.find_by id: params[:id]
  end

  def recruiter_params
    params
      .require(:recruiter)
      .permit(
        :company_name,
        :website,
        :description,
        technology_ids: [],
        user_attributes: [:username, :email, :password]
      )
  end
end

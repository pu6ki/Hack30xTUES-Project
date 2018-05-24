class RecruitersController < ApplicationController
  acts_as_token_authentication_handler_for User, only: [:index, :show, :edit, :update]

  before_action :set_recruiter,                  only: [:show, :edit, :update]
  before_action :check_access_for_unauthorized,  only: [:create, :new]

  def index
    @recruiters = Recruiter.all
  end

  def show
    @user = @recruiter.user
  end

  def new
    @recruiter = Recruiter.new
    @recruiter.build_user
  end

  def create
    @recruiter = Recruiter.new recruiter_params

    if @recruiter.save
      respond_to do |format|
        format.html { redirect_to @recruiter }
        format.json { render @recruiter, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @recruiter.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @recruiter.update_attributes recruiter_params
      respond_to do |format|
        format.html { redirect_to @recruiter }
        format.json { render @recruiter, status: :ok }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @recruiter.errors, status: :unprocessable_entity }
      end
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
        user_attributes: [:username, :email, :password, :description]
      )
  end
end

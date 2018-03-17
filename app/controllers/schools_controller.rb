class SchoolsController < ApplicationController
  acts_as_token_authentication_handler_for User, only: [:index, :show, :edit, :update]

  before_action :set_school,                     only: [:show, :edit, :update]
  before_action :set_contestants,                only: [:show, :edit, :update]
  before_action :check_access_for_unauthorized,  only: [:create, :new]

  def index
    @schools = School.all
  end

  def show
  end

  def new
    @school = School.new
    @school.build_user
  end

  def create
    @school = School.new school_params

    if @school.save
      respond_to do |format|
        format.html { redirect_to @school }
        format.json { render @school, status: :created }
      end
    else
      puts @school.errors.full_messages
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @school.update_attributes school_params
      respond_to do |format|
        format.html { redirect_to @school }
        format.json { render @school, status: :ok }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_school
    @school = School.find_by id: params[:id]
  end

  def set_contestants
    @contestants = @school.contestants
  end

  def school_params
    params.require(:school).permit(:name, :website, user_attributes: [:username, :email, :password])
  end
end

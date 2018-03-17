class ContestsController < ApplicationController
  acts_as_token_authentication_handler_for User

  before_action :validate_recruiter_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_contests,            only: [:new, :create]
  before_action :set_contest,             only: [:show, :edit, :update, :destroy]
  before_action :set_submissions,         only: [:show]
  before_action :set_submission,          only: [:show]
  before_action :validate_contest_author, only: [:edit, :update, :destroy]

  def index
    if current_user.recruiter?
      @contests = current_user.userable.contests.all
    else
      @contests = Contest.all
    end
  end

  def show
  end

  def new
    @contest = @contests.new
  end

  def create
    @contest = @contests.new contest_params

    if @contest.save
      respond_to do |format|
        format.html { redirect_to @contest }
        format.json { render @contest, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @contest.update_attributes contest_params
      respond_to do |format|
        format.html { redirect_to @contest }
        format.json { render @contest, status: :ok }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contest.destroy
    redirect_to contests_path
  end

  private

  def contest_params
    params.require(:contest).permit(:title, :description, :deadline, :technology_id)
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

  def validate_contest_author
    if current_user != @contest.recruiter.user
      respond_to do |format|
        format.html { redirect_to @contest }
        format.json do
          render json: {
            errors: 'You should be the author of this contest in order to access this page'
          }
        end
      end
    end
  end

  def set_submissions
    @submissions = @contest.submissions
  end

  def set_submission
    @submission = @submissions.new
  end

  def set_contests
    # Here we are sure that the user is a recruiter
    @contests = current_user.userable.contests
  end

  def set_contest
    @contest = Contest.find_by id: params[:id]
  end
end

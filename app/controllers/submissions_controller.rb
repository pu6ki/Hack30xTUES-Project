class SubmissionsController < ApplicationController
  acts_as_token_authentication_handler_for User

  before_action :validate_contestant_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_contest
  before_action :set_submission, only: [:show, :edit, :update, :destroy]

  def index
    @submissions = @contest.submissions.all
  end

  def show
  end

  def new
    @submission = @contest.submissions.new
  end

  def create
    @submission = @contest.submissions.new submission_params

    if @submission.save
      respond_to do |format|
        format.html { redirect_to @submission }
        format.json { render @submission, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @submission.update_attributes submission_params
      respond_to do |format|
        format.html { redirect_to @submission }
        format.json { render @submission, status: :ok }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @submission.destroy
    redirect_to submissions_path
  end

  private

  def submission_params
    params.require(:submission).permit(:source)
  end

  def validate_contestant_user
    redirect_to submissions_path unless current_user.contestant?
  end

  def set_contest
    @contest = Contest.find_by id: params[:contest_id]
  end

  def set_submission
    @submission = @contest.submissions.find_by id: params[:id]
  end
end

class SubmissionsController < ApplicationController
  acts_as_token_authentication_handler_for User

  before_action :validate_contestant_user, only: [:new, :create]
  before_action :set_contest
  before_action :set_submission,           only: [:show]

  def index
    @submissions = @contest.submissions.all

    if current_user.contestant?
      current_contestant = current_user.userable
      @submissions = @submissions.select { |s| s.contestant == current_contestant }
    end
  end

  def show
  end

  def new
    @submission = @contest.submissions.new
  end

  def create
    @submission = @contest.submissions.new submission_params
    @submission.contestant = current_user.userable

    if @submission.save
      SendSubmissionService.perform @submission

      respond_to do |format|
        format.html { redirect_to [@contest, @submission] }
        format.json { render @submission, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:source)
  end

  def set_contest
    @contest = Contest.find_by id: params[:contest_id]
  end

  def set_submission
    @submission = @contest.submissions.find_by id: params[:id]
  end
end

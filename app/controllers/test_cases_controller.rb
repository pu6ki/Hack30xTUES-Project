class TestCasesController < ApplicationController
  acts_as_token_authentication_handler_for User

  before_action :validate_recruiter_user
  before_action :set_contest
  before_action :validate_contest_author
  before_action :set_test_cases
  before_action :set_test_case, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @test_case = @test_cases.new
  end

  def create
    @test_case = @test_cases.new test_case_params

    if @test_case.save
      respond_to do |format|
        format.html { redirect_to @contest }
        format.json { render @test_case, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @test_case.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @test_case.update_attributes test_case_params
      respond_to do |format|
        format.html { redirect_to [@contest, @test_case] }
        format.json { render @test_case, status: :ok }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @test_case.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @test_case.destroy
    redirect_to contest_test_cases_path
  end

  private

  def validate_recruiter_user
    unless current_user.recruiter?
      respond_to do |format|
        format.html { redirect_to contest_test_cases_path }
        format.json do
          render json: {
            errors: 'You should be a recruiter in order to access this page'
          }
        end
      end
    end
  end

  def validate_contest_author
    if current_user.userable != @contest.recruiter
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

  def test_case_params
    params.require(:test_case).permit(:input, :expected_output)
  end

  def set_contest
    @contest = Contest.find_by id: params[:contest_id]
  end

  def set_test_cases
    @test_cases = @contest.test_cases
  end

  def set_test_case
    @test_case = @test_cases.find_by id: params[:id]
  end
end

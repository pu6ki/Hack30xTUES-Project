class ContestantsController < ApplicationController
  # acts_as_token_authentication_handler_for User, only: [:index, :show, :edit, :update]
  # before_action :set_school, only: [:create, :edit, :update, :destory]
  before_action :set_contestant, only: [:edit, :update, :show, :destory]

  def index
    @contestants = Contestant.all
  end

  def new
    @contestant = Contestant.new
    @contestant.build_user
  end

  def edit
  end

  def show
  end

  def create
    @contestant = Contestant.new contestant_params
    if @contestant.save
      respond_to do |format|
        format.json { render @contestant, status: :created }
        format.html { redirect_to @contestant }
      end
    else
      puts @contestant.errors.full_messages
      respond_to do |format|
        format.json { render json: @contestant.errors, status: :unprocessable_entity }
        format.html { render :new }
      end
    end
  end

  private

  def set_contestant
    @contestant = Contestant.find_by(id: params[:id])
  end

  def contestant_params
    params
      .require(:contestant)
      .permit(
        :first_name,
        :last_name,
        school_ids: [],
        user_attributes: [:username, :email, :password]
      )
  end
end

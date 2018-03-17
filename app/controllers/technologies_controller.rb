class TechnologiesController < ApplicationController
  acts_as_token_authentication_handler_for User

  def index
    @technologies = Technology.all
  end

  def create
    @technology = Technology.new(technology_params)

    if @technology.save
      render json: @technology
    else
      render json: @technology.errors.full_messages
    end
  end

  def show
    @technology = Technology.find_by id: params[:id]
  end

  private

  def technology_params
    params.require(:technology).permit(:name)
  end
end

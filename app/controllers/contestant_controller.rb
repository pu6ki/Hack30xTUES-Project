class ContestantController < ApplicationController
  # TODO: authecnticate_user!
  def index
    @contestants = Contestant.all
  end

  def create
    @contestant = Contestant.create!(contestant_params)
  end

  private

  def contestant_params
    params.requiere(:user).permit(:first_name, :last_name)
  end
end

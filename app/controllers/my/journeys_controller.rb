class My::JourneysController < ApplicationController

  def index
    @journeys = policy_scope([:my, Journey]).where(user_id: current_user)
  end

  def edit
    @journey = Journey.find(params[:id])
    authorize [:my, @journey]
  end

  def update
    @journey = Journey.find(params[:id])
    @journey.update(journey_params)
    authorize [:my, @journey]
    redirect_to my_journeys_path
    end

  def destroy
    @journey = Journey.find(params[:id])
    @journey.destroy
    authorize [:my, @journey]
    redirect_to my_journeys_path
  end

  private

  def journey_params
    params.require(:journey).permit(:title, :content, :public, :challenge_rating)
  end

end

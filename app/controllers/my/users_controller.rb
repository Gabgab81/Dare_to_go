class My::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @dares = Dare.where(user_id: params[:id]).includes([:challenge])
    @dares_complete = @dares.where(progress: "validated")
    @dares_in_progress = @dares.where(progress: "pending")
    @journeys = Journey.where(user_id: params[:id])
    authorize [:my, @user]
  end

end

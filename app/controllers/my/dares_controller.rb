class My::DaresController < ApplicationController
  def index
    @dares = policy_scope([:my, Dare]).where(user_id: current_user).includes([:challenge])
    @dares_pending = @dares.where(progress: "pending")
    @dares_completed = @dares.where(progress: "validated").last(5)
  end
end

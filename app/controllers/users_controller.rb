class UsersController < ApplicationController

  def index
    @users = policy_scope(User).all
    @users_sorted = @users.sort_by{ |user| user.total_xp}.reverse.first(10)
  end

end

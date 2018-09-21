class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @user_points = @user.calculate_point
  end

end

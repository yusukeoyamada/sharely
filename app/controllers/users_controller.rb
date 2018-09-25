class UsersController < ApplicationController
  before_action :set_user_and_user_points, only: [:show, :questions, :answers]

  def show
  end

  def questions
  end

  def answers
    @answers = Answer.where(user_id: params[:id])
  end

  private
    def set_user_and_user_points
     @user = User.find(params[:id])
     @user_points = @user.calculate_point
    end

end

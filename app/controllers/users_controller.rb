class UsersController < ApplicationController
  before_action :set_user_infomation, only: [:show, :edit, :update]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new', notice:"新たにユーザー情報を登録しました！"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "ユーザー情報を編集しました！"
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,
       :email, :password, :password_confirmation)
  end

  def set_user_infomation
    @user = User.find_by(params[:id])
  end
end

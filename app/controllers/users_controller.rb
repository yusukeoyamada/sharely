class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def confirm
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
  end

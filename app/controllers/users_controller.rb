class UsersController < ApplicationController

  def new
    @user = User.new
    @title = "Nuevo usuario"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      #sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      #redirect_to user_path(@user)
    else
      render 'new'
      @title = "Nuevo usuario"
    end
  end
end

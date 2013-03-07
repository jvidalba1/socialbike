class UsersController < ApplicationController

  before_filter :signed_in_user,  :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user,    :only => [:index, :edit, :update, ]

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
    @user = User.new
    @title = "Nuevo usuario"
  end

  def create

    @user = User.new(params[:user])

    if @user.save
      sign_in @user
      flash[:success] = "Bienvenido a SocialBike"
      redirect_to user_path(@user)
    else
      render 'new'
      @title = "Nuevo usuario"
    end
  end

  def edit
    @user = User.find(params[:id])
    @title = "Edit user"
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])

      flash[:success] = "Your data were updated successfully"
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end

  end

  def index
    @users = User.paginate(:page => params[:page])
    @title = "All users"
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  private

  def signed_in_user
    deny_access unless signed_in?
  end

  def deny_access
    store_location
    #flash[:notice] => "Please sign in"
    redirect_to signin_path, :notice => "Please sign in"
  end

  def correct_user
    @user = User.find(params[:id])
    flash[:notice] = "You cant access to that user edit"
    redirect_to(user_path) unless current_user?(@user)
  end
end

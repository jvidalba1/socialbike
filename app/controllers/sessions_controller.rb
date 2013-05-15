class SessionsController < ApplicationController

  def new
    @title = "Sign in"
  end

  def create

    if (params[:session][:email].eql?"") || (params[:session][:password].eql?"")
      flash[:error] = "Llene todos los campos por favor"
      render 'new'

    else
      @user = User.find_by_email(params[:session][:email].downcase)

      if @user && User.authenticate(params[:session][:email], params[:session][:password])
        flash[:success] ="Bienvenido"
        sign_in @user
        redirect_back_or @user
      else
        flash[:error] = 'Combinacion de email/password invalidos'
        render 'new'
    end
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  def create_twitter
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
  end

end
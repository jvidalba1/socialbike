class PagesController < ApplicationController

  def index
    @title = "Inicio"
  end

  def oelo
    email = params[:email] rescue nil

    emails = email.gsub(" ","").split(",")
    p "+++++++++++++++++++++++++#{@current_user.name}"
    emails.each do |email_to_send|
      UserMailer.registration_confirmation(email_to_send).deliver
    end

    flash[:success] = "Invitacion enviada"
    render :action => 'index'
  end

  def contact
    @title = "Contacto"
  end

  def about
    @title = "Acerca de"
  end
end

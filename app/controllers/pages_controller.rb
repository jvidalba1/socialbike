class PagesController < ApplicationController

  def index
    @title = "Inicio"
    #UserMailer.registration_confirmation(@usuario,params[:usuario][:clave]).deliver
  end

  def contact
    @title = "Contacto"
  end

  def about
    @title = "Acerca de"
  end
end

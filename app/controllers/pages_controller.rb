class PagesController < ApplicationController

  def index
    @title = "Inicio"
  end

  def contact
    @title = "Contacto"
  end

  def about
    @title = "Acerca de"
  end
end

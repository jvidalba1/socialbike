class EventsController < ApplicationController

  before_filter :signed_in_user

  def index

  end

  def new
    @event = Event.new
    @title = "Nuevo evento"
  end

  def create
    @event =  @current_user.events.build(params[:event])

    if @event.save
      flash[:success] = "Evento creado exitosamente"
      redirect_to root_path
    else
      flash[:alert] = "Hay errores en los datos de entrada"
      render :action => 'new'

    end
  end

  def destroy

  end
end

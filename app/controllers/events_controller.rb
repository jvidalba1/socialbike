class EventsController < ApplicationController

  before_filter :signed_in_user

  def index

  end

  def new
    @event = Event.new
    @title = "Nuevo evento"
    @users = User.all
    @invitation = Invitation.new
  end

  def create
    @event =  @current_user.events.build(params[:event])
    @users = User.all

    if @event.save
      hash1 = Hash.new
      hash1 = { "event_id" => @event.id}

      for com in params[:invitation] do
        com.merge! hash1
      end

      Invitation.create!(params[:invitation])
      flash[:success] = "Evento creado exitosamente"
      redirect_to root_path
    else
      @feed_items = []
      flash[:alert] = "Hay errores en los datos de entrada"
      render :action => 'new'

    end
  end

  def destroy

  end
end

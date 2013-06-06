class EventsController < ApplicationController

  before_filter :signed_in_user
  before_filter :correct_user_events, :only => [:edit]

  def index

  end

  def show
    @event = Event.find(params[:id])
    @title = "Evento "+@event.name

    @comment = @event.comments.build(params[:comment])

    @comments = @event.comments
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

      if params[:invitation].present?
        hash1 = Hash.new
        hash1 = { "event_id" => @event.id}

        for com in params[:invitation] do
          com.merge! hash1
        end

        Invitation.create!(params[:invitation])

        flash[:success] = "Evento creado exitosamente"
        redirect_to root_path

      else
        flash[:success] = "Evento creado exitosamente, no invitaste a nadie :("
        redirect_to root_path
      end

    else
      @feed_items = []
      flash[:alert] = "Hay errores en los datos de entrada"
      render :action => 'new'

    end
  end

  def edit
    @event = Event.find(params[:id])
    @title = "Editar evento"
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(params[:event])

      flash[:success] = "Evento actualizado"
      redirect_to root_path
    else
      flash[:alert] ="Error en los datos"
      @title = "Editar evento"
      render 'edit'
    end
  end

  def add_user

    @invitation = Invitation.new
    @users = User.all
    p "oelo entro"
    respond_to do |format|
      format.js
    end

  end
end

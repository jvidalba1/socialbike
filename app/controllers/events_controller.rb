class EventsController < ApplicationController

  before_filter :signed_in_user

  def index

  end

  def new
    @event = Event.new
    @title = "Nuevo evento"
    @users = User.all
  end

  def create
    @event =  @current_user.events.build(params[:event])
    @users = User.all

    p "event id: #{@event.id}"

    inv = []
    params[:users].each do |a|
      Invitation.create!("user_id" => a)
      inv << Invitation.find_by_user_id(a)
    end

    if @event.save

      inv.each do |a|
        Events_Invitations.create!("event_id" => @event.id, "invitation_id" => a.id )
      end

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

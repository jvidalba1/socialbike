class InvitationsController < ApplicationController

  before_filter :signed_in_user

  def invitation_user
    @invitations = @current_user.invitations
  end

  def invitation_event
    @event = Event.find(params[:id])
    @users = @event.users
  end

end

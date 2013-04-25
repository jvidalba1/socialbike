class EventsController < ApplicationController

  before_filter :signed_in_userm, :only => [:create, :destroy]

  def index

  end

  def create

  end

  def destroy

  end
end

class FeedsController < ApplicationController

  before_filter :signed_in_user

  def index
      @feed_items = Event.where("").paginate(:per_page => 20, :page  => params[:page])
  end
end

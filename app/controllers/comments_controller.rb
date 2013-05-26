class CommentsController < ApplicationController

  before_filter :signed_in_user
=begin
  def new
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new
  end
=end
  def create

    if params[:blog_id].present?
      @blog = Blog.find(params[:blog_id])
      @comment = @blog.comments.build(params[:comment])
      @comment.user_id = @current_user.id

      if @comment.save
        flash[:success] = "Comentario creado"
        redirect_to @blog
      else
        flash[:alert] = "problemas"
        render @blog
      end

    elsif params[:event_id].present?
      @event = Event.find(params[:event_id])
      @comment = @event.comments.build(params[:comment])
      @comment.user_id = @current_user.id

      if @comment.save
        flash[:success] = "Comentario creado"
        redirect_to @event
      else
        flash[:alert] = "problemas"
        render @event
      end
    end

  end
end

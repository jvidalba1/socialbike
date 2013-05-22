class CommentsController < ApplicationController
=begin
  def new
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new
  end
=end
  def create
    @blog = Blog.find(params[:blog_id])

    @comment = @blog.comments.build(params[:comment])
      if @comment.save
        flash[:success] = "Comentario creado"
        redirect_to @blog
      else
        flash[:alert] = "problemas"
        render @blog
      end
  end

end

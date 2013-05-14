class BlogsController < ApplicationController

  before_filter :signed_in_user

  def index

  end

  def show
    @blog = Blog.find(params[:id])
    @title = "Blog "+@blog.name
  end

  def new
    @blog = Blog.new
    @title = "Nuevo blog"
  end

  def create
    @blog =  @current_user.blogs.build(params[:blog])

    if @blog.save
      flash[:success] = "Blog creado exitosamente"
      redirect_to root_path
    else
      @feed_items = []
      flash[:alert] = "Hay errores en los datos de entrada"
      render :action => 'new'
    end

  end

  def edit

  end

  def update

  end

  def destroy

  end

end

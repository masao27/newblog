class NblogsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @blogs = Nblog.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end 

  def new
    @nblog = Nblog.new
  end
  
  def create
    Nblog.create(blog_params)
    redirect_to action: :index
  end

  def destroy
    blog = Nblog.find(params[:id])
    if blog.user_id == current_user.id
      blog.destroy
    end
    redirect_to action: :index
  end

  def edit
    @nblog = Nblog.find(params[:id])
  end

  def update
    nblog = Nblog.find(params[:id])
    if nblog.user_id == current_user.id
      nblog.update(blog_params)
    end
    redirect_to action: :index
  end

  private
  def blog_params
    params.require(:nblog).permit(:text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end

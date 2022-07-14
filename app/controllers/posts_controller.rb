class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def show
    @post = User.find(params[:user_id]).posts.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

class PostsController < ApplicationController
  load_and_authorize_resource

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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted successfully'
    redirect_to user_posts_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

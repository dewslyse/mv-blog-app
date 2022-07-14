class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @like = Like.new(user: @user, post: @post)
    @like.save
    redirect_to user_post_path(@user, @post)
  end
end

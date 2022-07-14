class CommentsController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new(user: @user, post: @post, text: params[:text])
    @comment.save
    redirect_to user_post_path(@user, @post)
  end
end

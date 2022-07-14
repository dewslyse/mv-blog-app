class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @user.comments.new(post: @post, text: params[:text])
    @comment.save
    redirect_to user_post_path(@user, @post)
  end
end

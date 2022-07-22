class CommentsController < ApplicationController
  load_and_authorize_resource

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

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment.post_id)
    @comment.destroy
    @post.decrement!(:comments_counter)
    redirect_to user_post_path(current_user, @comment.post_id)
  end
end

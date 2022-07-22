class Api::V1::CommentsController < ApplicationController
  def index
    @comments = Comment.all
    render json: @comments, only: [:id, :text]
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @user.comments.new(@user, @post, comment_params)
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

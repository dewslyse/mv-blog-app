class Api::V1::CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.includes(:author)
    render json: @comments, status: :ok
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @user.comments.new(post: @post, text: params[:text])

    if @comment.save
      render json: { status: 201, message: 'Comment created successfully!', content: { comment: @comment } }
    else
      render json: @comment.errors, status: :bad_request, message: 'Operation failed'
    end
  end
end

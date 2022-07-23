class Api::V1::CommentsController < ApplicationController
  def index
<<<<<<< HEAD
    @post = Post.find(params[:post_id])
    @comments = @post.comments.includes(:author)
    render json: @comments, status: :ok
=======
    @comments = Comment.all
    render json: @comments, only: [:id, :text]
>>>>>>> 754214ce719e477f5933206b3414f8d314b90e98
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
<<<<<<< HEAD
    @comment = @user.comments.new(post: @post, text: params[:text])

    if @comment.save
      render json: { status: 201, message: 'Comment created successfully!', content: { comment: @comment } }
    else
      render json: @comment.errors, status: :bad_request, message: 'Operation failed'
    end
  end
=======
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
>>>>>>> 754214ce719e477f5933206b3414f8d314b90e98
end

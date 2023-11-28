# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(params[:post_id]), notice: 'Comment added successfully!😊'
    else
      redirect_to post_path(params[:post_id]), alert: 'Failed to add comment!😞'
    end
  end

  def destroy
    @comment = PostComment.find(params[:id])
    @post = @comment.post
    if @comment.destroy
      redirect_to post_path(@post), notice: 'Comment delete!😊'
    else
      redirect_to post_path(@post), alert: 'Failed to delete comment 😞'
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end

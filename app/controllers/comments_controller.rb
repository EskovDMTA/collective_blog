# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(params[:post_id]), notice: I18n.t('comments.created_successfully')
    else
      redirect_to post_path(params[:post_id]), alert: I18n.t('comments.created_failed')
    end
  end

  def destroy
    @comment = PostComment.find(params[:id])
    @post = @comment.post
    if @comment.destroy
      redirect_to post_path(@post), notice: I18n.t('comments.delete_successfully')
    else
      redirect_to post_path(@post), alert: I18n.t('comments.delete_failed')
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end

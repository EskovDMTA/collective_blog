# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[create destroy]
  before_action :authorize_like_owner!, only: %i[destroy]

  def create
    @like = @post.likes.new(user: current_user)
    @like.save
    redirect_to @post
  end

  def destroy
    @like = PostLike.find(params[:id])
    @like.destroy
    redirect_to @post
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def authorize_like_owner!
    @like = PostLike.find(params[:id])
    return unless @like.user != current_user

    redirect_to root_path
  end
end

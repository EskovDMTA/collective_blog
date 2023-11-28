# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[create destroy]

  def create
    @like = @post.likes.new(user: current_user)
    @like.save
    redirect_to @post, notice: '👍'
  end

  def destroy
    @like = PostLike.find(params[:id])
    @like.destroy
    redirect_to @post, notice: '👎'
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end

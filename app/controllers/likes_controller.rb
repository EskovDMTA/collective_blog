class LikesController < ApplicationController
  before_action :get_post, only: %i[create destroy]

  def create
    @like = @post.post_likes.new(user: current_user)
    redirect_to @post
  end

  def destroy
  end

  private

  def get_post
    @post = Post.find(params[:id])
  end
end

class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_post, only: %i[create destroy]

  def create
    @like = @post.post_likes.new(user: current_user)
    @like.save
    redirect_to @post
  end

  def destroy
    @like = PostLike.find(params[:id])
    @like.destroy
    redirect_to @post
  end

  private

  def get_post
    @post = Post.find(params[:post_id])
  end
end

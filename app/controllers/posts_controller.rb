# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  layout "base_page", only: %i[show]
  def index
    @posts = Post.all
    @popular_posts = Post.limit(3)
    @big_post = Post.order("RANDOM()").first
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.post_comments.roots.order(created_at: :desc)

    return unless user_signed_in?

    @comment = @post.post_comments.new(post_id: @post.id, user_id: current_user.id)
  end

  def new
    if authenticate_user!
      @post = current_user.posts.build
      @categories = Category.all
      @user = current_user
    else
      redirect_to sign_in
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path, notice: 'Post created successfully!'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id, :image)
  end

end

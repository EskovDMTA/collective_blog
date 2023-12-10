# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create edit update destroy]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :post_author, only: %i[edit update destroy]

  def index
    @posts = Post.all
  end

  def show
    @comments = @post.comments.roots.order(created_at: :desc)

    return unless user_signed_in?

    @comment = @post.comments.new(post_id: @post.id, user_id: current_user.id)
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

  def edit
    @categories = Category.all
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path, notice: I18n.t('posts.created_successfully')
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: I18n.t('posts.updated_successfully')
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: I18n.t('posts.deleted_successfully')
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id, :image)
  end

  def post_author
    redirect_to root_path, alert: I18n.t('posts.not_authorized') unless current_user == @post.creator
  end
end

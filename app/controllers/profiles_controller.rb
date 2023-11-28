# frozen_string_literal: true

# app/controllers/profiles_controller.rb

class ProfilesController < ApplicationController
  layout 'profile_layouts'

  before_action :authenticate_user!

  def show
    @user = current_user
    @posts = @user.posts
    @posts_count = @posts.count
    @likes_count = @user.post_likes.count
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_path, notice: I18n.t('profile.updated_successfully')
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :avatar, :profession)
  end
end

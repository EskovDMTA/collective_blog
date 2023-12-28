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
end

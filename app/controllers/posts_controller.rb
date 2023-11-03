# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @user_data = user_signed_in?
    @user_current = current_user
  end
end

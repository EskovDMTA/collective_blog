# frozen_string_literal: true
class HomePageController < ApplicationController
  def index
    @popular_posts = Post.order(likes_count: :desc).limit(3)
    @big_post = Post.order("RANDOM()").first
  end

end

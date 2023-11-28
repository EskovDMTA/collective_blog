# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:with_comments)
    @user = users(:one)
    sign_in(@user)
  end

  test 'should create like' do
    assert_difference('PostLike.count', 1) do
      post post_likes_path(@post.id)
    end

    assert_redirected_to post_path(@post)
  end

  test 'should destroy like' do
    like = @post.likes.create(user: @user)

    assert_difference('PostLike.count', -1) do
      delete post_like_path(@post, like)
    end

    assert_redirected_to post_path(@post)
  end
end

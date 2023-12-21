# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:with_comments)
    @user = users(:one)
    sign_in(@user)
  end

  test 'should create like' do
    initial_like_count = PostLike.count
    post post_likes_path(@post.id, locale: :en)

    assert_equal(initial_like_count + 1, PostLike.count)
  end

  test 'should destroy like' do
    like = @post.likes.create(user: @user)
    initial_like_count = PostLike.count

    delete post_like_path(@post, like, locale: :en)

    assert_equal(initial_like_count - 1, PostLike.count)
  end
end

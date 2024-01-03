# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:with_comments)
    @user = users(:one)
    sign_in(@user)
  end

  test 'should create like' do
    post post_likes_path(@post.id)
    post_comment = PostLike.find_by(post_id: @post.id, user_id: @user.id)

    assert(post_comment)
  end

  test 'should destroy like' do
    like = @post.likes.create(user: @user)

    delete post_like_path(@post, like)

    assert_nil(PostLike.find_by(post_id: @post.id, user_id: @user.id))
  end
end

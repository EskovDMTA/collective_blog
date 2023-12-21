# frozen_string_literal: true

require_relative '../test_helper'

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_one = users(:one)
    @post = posts(:one)
    @comment_one = post_comments(:with_comments)

    sign_in(@user_one)
  end

  test 'should create comment' do
    initial_comments_count = @post.comments.count
    post post_comments_url(@post), params: {
      post_comment: {
        post_id: @post.id,
        user_id: @post.creator,
        content: @comment_one.content
      }
    }

    assert_equal(initial_comments_count + 1, @post.comments.count)

    assert_response :redirect
    assert_redirected_to post_path(@post)
  end

  test 'should create nested comment with comments' do
    assert_difference('PostComment.count', 3) do
      post post_comments_url(post_id: posts(:with_comments).id),
           params: { post_comment: { content: 'This is a comment' } }
      post post_comments_url(post_id: posts(:with_comments).id),
           params: { post_comment: { content: 'Nested comment',
                                     parent_id: post_comments(:with_comments).id } }
      post post_comments_url(post_id: posts(:with_comments).id),
           params: { post_comment: { content: 'Deep comment',
                                     parent_id: post_comments(:nested).id } }
    end

    assert_redirected_to post_path(posts(:with_comments))

    assert_equal 1, post_comments(:with_comments).children.count
    assert_equal 1, post_comments(:nested).children.count
  end
end

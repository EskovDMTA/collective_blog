# frozen_string_literal: true

require_relative '../test_helper'

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get '/users/sign_in'
    @user_one = users(:one)
    @post = posts(:one)
    @comment_one = post_comments(:with_comments)

    sign_in(@user_one)
  end

  test 'should create comment' do
    post post_comments_url(@post), params: {
      post_comment: {
        post_id: @post.id,
        user_id: @post.creator,
        content: @comment_one.content
      }
    }

    assert_response :redirect
    assert_redirected_to post_path(@post)
  end

  test 'should create nested comment with comments' do
    assert_difference('PostComment.count', 3) do
      post post_comments_url(post_id: @post.id),
           params: { post_comment: { content: 'This is a comment' } }
      post post_comments_url(post_id: @post.id),
           params: { post_comment: { content: 'Nested comment',
                                     parent_id: PostComment.find_by(content: 'This is a comment').id } }
      post post_comments_url(post_id: @post.id),
           params: { post_comment: { content: 'Deep comment',
                                     parent_id: PostComment.find_by(content: 'Nested comment').id } }
    end

    assert_redirected_to post_path(@post)
    assert_equal 'Comment added successfully!😊', flash[:notice]

    assert_equal 1, PostComment.find_by(content: 'This is a comment').children.count
    assert_equal 1, PostComment.find_by(content: 'Nested comment').children.count
  end
end

# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get '/users/sign_in'
    @user_one = users(:one)
    @post_with_comments = posts(:with_comments)
    @comment_one = post_comments(:one)

    sign_in(@user_one)
  end

  test 'should create comment' do
    post post_comments_url(@post_with_comments), params: {
      post_comment: {
        post_id: @comment_one.post_id,
        user_id: @comment_one.user_id,
        content: @comment_one.content
      }
    }

    assert_response :redirect
    assert_redirected_to post_path(@post_with_comments, anchor: "post_comment_#{PostComment.last.id}")
  end

  test 'should create comment with comments' do
    assert_difference('PostComment.count', 3) do
      post post_comments_url(post_id: @post.id), params: { post_comment: { content: 'This is a comment with comments' } }
      post post_comments_url(post_id: @post.id),
           params: { post_comment: { content: 'Commented comment', parent_id: PostComment.find_by(content: 'This is a comment with comments').id } }
      post post_comments_url(post_id: @post.id),
           params: { post_comment: { content: 'Deep comment', parent_id: PostComment.find_by(content: 'Commented comment').id } }
    end

    assert_redirected_to post_path(@post)
    assert_equal 'Comment added successfully!😊', flash[:notice]

    assert_equal 1, PostComment.find_by(content: 'This is a comment with comments').children.count
    assert_equal 1, PostComment.find_by(content: 'Commented comment').children.count
  end

  test 'should destroy comment with comments' do
    assert_difference('PostComment.count', -3) do
      delete post_comment_url(@comment_with_comments)
    end

    assert_redirected_to post_path(@post)
    assert_equal 'Comment delete!😊', flash[:notice]

    assert_nil PostComment.find_by(content: 'This is a comment with comments')
    assert_nil PostComment.find_by(content: 'Commented comment')
    assert_nil PostComment.find_by(content: 'Deep comment')
  end
end

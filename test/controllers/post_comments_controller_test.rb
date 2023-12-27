# frozen_string_literal: true

require_relative '../test_helper'

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_one = users(:one)
    @post = posts(:one)
    @comment_one = post_comments(:with_comments)
    @post_with_comments = posts(:with_comments)
    @nested_comment = post_comments(:nested)
    @deep_comment = post_comments(:deep_nested)

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
    post_comment = @post.comments.find_by(post_id: @post.id,
                                          user_id: @post.creator,
                                          content: @comment_one.content)

    assert(post_comment)

    assert_response :redirect
    assert_redirected_to post_path(@post)
  end

  test 'should create nested comment with comments' do
    post post_comments_url(post_id: @post_with_comments,
                           params: { post_comment: { content: @nested_comment.content,
                                                     ancestry: @nested_comment.ancestry } })

    nested_comment = PostComment.find_by(post_id: @post_with_comments,
                                         content: @nested_comment.content,
                                         ancestry: @nested_comment.ancestry)

    assert(nested_comment)

    post post_comments_url(post_id: @post_with_comments,
                           params: { post_comment: { content: @deep_comment.content,
                                                     ancestry: @deep_comment.ancestry } })
    deep_comment = PostComment.find_by(post_id: @post_with_comments,
                                       content: @deep_comment.content,
                                       ancestry: @deep_comment.ancestry)

    assert(deep_comment)
  end
end

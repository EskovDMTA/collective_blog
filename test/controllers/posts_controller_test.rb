# frozen_string_literal: true

require_relative '../test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @categories = categories(:one)
    sign_in(users(:one))
  end
  test 'should get index' do
    get posts_url

    assert_response :success
  end

  test 'should get new' do
    get new_post_path

    assert_response :success
  end

  test 'should create post' do
    initial_post_count = Post.count
    post posts_url, params: {
      post: {
        title: @post.title,
        body: @post.body,
        category_id: @categories.id,
        creator: users(:one),
        image: fixture_file_upload('post_image.jpg', 'image/jpg')
      }
    }

    assert_equal(initial_post_count + 1, Post.count)
  end

  test 'should show post' do
    get post_url(@post, locale: :en)

    assert_response :success
  end

  test 'should update post' do
    updated_title = 'Updated title'
    updated_body = 'Updated body'
    patch post_url(@post, locale: :en), params: {
      post: {
        title: updated_title,
        body: updated_body,
        category_id: @categories.id,
        creator: users(:one),
        image: fixture_file_upload('post_image.jpg', 'image/jpg')
      }
    }
    @post.reload

    assert_equal updated_title, @post.title
    assert_equal updated_body, @post.body
    assert_redirected_to post_url(@post)
  end

  test 'should destroy post' do
    initial_post_count = Post.count
    delete post_url(@post, locale: :en)

    assert_equal(initial_post_count - 1, Post.count)
    assert_redirected_to root_path
  end
end

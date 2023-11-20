require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @categories = categories(:one)
    get '/users/sign_in'
    sign_in(users(:one))
  end
  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_path
    assert_response :success
  end

  test "should create post"  do
    assert_difference('Post.count') do
      post posts_url, params: {
        post: {
          title: @post.title,
          body: @post.body,
          category_id: @categories.id,
          creator: users(:one)
        }
      }
    end
  end

  test 'should show post' do
    get post_url(@post)

    assert_response :success
  end

end

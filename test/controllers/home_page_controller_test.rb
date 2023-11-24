# frozen_string_literal: true

require_relative '../test_helper'

class HomePageControllerTest < ActionDispatch::IntegrationTest
  test 'should get home_page' do
    get root_url
    assert_response :success
  end

  test 'should display partials' do
    get root_url
    assert_select 'header', count: 1
    assert_select 'main', count: 1
    assert_select 'section.blog_slider', count: 1
    assert_select 'section.popular_posts', count: 1
    assert_select 'section.big_post', count: 1
    assert_select 'footer', count: 1
  end
end

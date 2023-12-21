# frozen_string_literal: true

require_relative '../test_helper'

class HomePageControllerTest < ActionDispatch::IntegrationTest
  test 'should get home_page' do
    get root_url

    assert_response :success
  end
end

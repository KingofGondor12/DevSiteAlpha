require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get games" do
    get pages_games_url
    assert_response :success
  end

  test "should get store" do
    get pages_store_url
    assert_response :success
  end

  test "should get help" do
    get pages_help_url
    assert_response :success
  end

end

require 'test_helper'

class RecruitsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recruits_index_url
    assert_response :success
  end

  test "should get show" do
    get recruits_show_url
    assert_response :success
  end

  test "should get new" do
    get recruits_new_url
    assert_response :success
  end

end

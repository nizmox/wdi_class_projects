require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get number" do
    get :number
    assert_response :success
  end

  test "should get text" do
    get :text
    assert_response :success
  end

  test "should get assets" do
    get :assets
    assert_response :success
  end

  test "should get url" do
    get :url
    assert_response :success
  end

end

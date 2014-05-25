require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get genre" do
    get :genre
    assert_response :success
  end

  test "should get series" do
    get :series
    assert_response :success
  end

  test "should get fandom" do
    get :fandom
    assert_response :success
  end

end

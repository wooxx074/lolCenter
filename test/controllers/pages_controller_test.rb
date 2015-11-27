require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get player" do
    get :player
    assert_response :success
  end

  test "should get team" do
    get :team
    assert_response :success
  end

  test "should get league" do
    get :league
    assert_response :success
  end

end

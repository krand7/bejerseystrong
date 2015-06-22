require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  setup do
    @regular_user = users(:one)
  end

  test "should get index" do
    login(@regular_user)
    get :index
    assert_response :success
  end

  test "should get edit" do
    login(@regular_user)
    get :edit
    assert_response :success
  end

  test "should get update" do
    login(@regular_user)
    get :update
    assert_response :success
  end

  test "should get show" do
    login(@regular_user)
    get :show
    assert_response :success
  end

  test "should get destroy" do
    login(@regular_user)
    get :destroy
    assert_response :success
  end

end

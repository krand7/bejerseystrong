require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  setup do
    @admin = users(:admin)
    @user = users(:regular)
  end

  test "should get index" do
    login(@admin)
    get :index
    assert_response :success
  end

  test "should get update" do
    login(@admin)
    patch :update, id: @user, user: { language_one: 'English' }
    assert_redirected_to profile_path
  end

  test "should get show" do
    login(@admin)
    get :show, id: @user
    assert_response :success
  end

  test "should get destroy" do
    login(@admin)
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end
    assert_redirected_to users_path
  end

end

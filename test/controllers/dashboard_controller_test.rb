require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  setup do
    @user = users(:regular)
    @admin = users(:admin)
  end

  test "should get profile"  do
    login(@user)
    get :profile
    assert_response :success
  end

  test "should get dashboard"  do
    login(@user)
    get :show
    assert_response :success
  end

  test "should get aggregate report"  do
    login(@user)
    get :aggregate_report
    assert_response :redirect

    login(@admin)
    get :aggregate_report
    assert_response :redirect
  end
end

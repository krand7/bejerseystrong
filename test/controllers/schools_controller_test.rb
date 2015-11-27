require 'test_helper'

class SchoolsControllerTest < ActionController::TestCase
  setup do
    @admin = users(:admin)
    @captain = users(:captain)
    @school = schools(:one)
  end

  test "should get index" do
    login(@admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:schools)
  end

  test "should get new" do
    login(@admin)
    get :new
    assert_response :success
  end

  test "should create school" do
    login(@admin)
    assert_difference('School.count') do
      post :create, school: { name: 'New School', slug: 'new_school' }
    end

    assert_redirected_to school_path(assigns(:school))
  end

  test "should show school" do
    login(@admin)
    get :show, id: @school
    assert_response :success
  end

  test "should get edit" do
    login(@admin)
    get :edit, id: @school
    assert_response :success
  end

  test "should update school" do
    login(@admin)
    patch :update, id: @school, school: { name: 'Updated name' }
    assert_redirected_to school_path(assigns(:school))
  end

  test "should destroy school" do
    login(@admin)
    assert_difference('School.current.count', -1) do
      delete :destroy, id: @school
    end

    assert_redirected_to schools_path
  end


  test "should get my school for campus captains" do
    get :my_school
    assert_response :redirect

    login(@captain)
    get :my_school
    assert_response :success
  end
end

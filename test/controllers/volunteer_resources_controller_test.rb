require 'test_helper'

class VolunteerResourcesControllerTest < ActionController::TestCase
  setup do
    @user = users(:regular)
    @admin = users(:admin)
    @volunteer_resource = volunteer_resources(:one)
  end

  test "should get index" do
    login(@admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:volunteer_resources)
  end

  test "should get new" do
    login(@admin)
    get :new
    assert_response :success
  end

  test "should create volunteer_resource" do
    login(@admin)
    assert_difference('VolunteerResource.count') do
      post :create, volunteer_resource: { description: 'this is a new resource', title: 'new resource' }
    end

    assert_redirected_to volunteer_resource_path(assigns(:volunteer_resource))
  end

  test "should show volunteer_resource" do
    login(@admin)
    get :show, id: @volunteer_resource
    assert_response :success
  end

  test "should get edit" do
    login(@admin)
    get :edit, id: @volunteer_resource
    assert_response :success
  end

  test "should update volunteer_resource" do
    login(@admin)
    patch :update, id: @volunteer_resource, volunteer_resource: { description: 'new description' }
    assert_redirected_to volunteer_resource_path(assigns(:volunteer_resource))
  end

  test "should destroy volunteer_resource" do
    login(@admin)
    assert_difference('VolunteerResource.current.count', -1) do
      delete :destroy, id: @volunteer_resource
    end

    assert_redirected_to volunteer_resources_path
  end

  test "should get file as normal volunteer" do
    login(@user)
    get :file, id: @volunteer_resource
    assert_response :success
  end
end

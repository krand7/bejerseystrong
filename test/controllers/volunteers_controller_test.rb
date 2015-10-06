require 'test_helper'

class VolunteersControllerTest < ActionController::TestCase
  setup do
    @volunteer = volunteers(:one)
    @admin = users(:admin)
  end

  test "should get index" do
    login(@admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:volunteers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create volunteer" do
    assert_difference('Volunteer.count') do
      post :create, volunteer: { email: 'new@volunteer.com', first_name: 'New', last_name: 'Volunteer', zip_code: '11111' }
    end

    assert_redirected_to volunteer_path(assigns(:volunteer))
  end

  test "should show volunteer" do
    login(@admin)
    get :show, id: @volunteer
    assert_response :success
  end

  test "should get edit" do
    login(@admin)
    get :edit, id: @volunteer
    assert_response :success
  end

  test "should update volunteer" do
    login(@admin)
    patch :update, id: @volunteer, volunteer: { first_name: 'NewName' }
    assert_redirected_to volunteers_path
  end

  test "should destroy volunteer" do
    login(@admin)
    assert_difference('Volunteer.current.count', -1) do
      delete :destroy, id: @volunteer
    end

    assert_redirected_to volunteers_path
  end
end

require 'test_helper'

class AppointmentsControllerTest < ActionController::TestCase
  setup do
    @appointment = appointments(:one)
    @user = users(:regular)
    @captain = users(:captain)
  end

  test "should get index as campus captain" do
    login(@captain)
    get :index
    assert_response :success
  end

  test "should get index and redirect to my appointments for volunteer" do
    login(@user)
    get :index
    assert_redirected_to :my_appointments
  end

  test "should get new" do
    login(@user)
    get :new
    assert_response :success
  end

  test "should create appointment" do
    login(@user)
    assert_difference('Appointment.count') do
      post :create, appointment: { address_line_one: '123 House Ave', city: 'Princeton', created_by_id: @user.id, end_time: Time.current, location: 'Church', date: Date.today, start_time: Time.current, user_id: @user.id, zipcode: '12345' }
    end

    assert_redirected_to appointment_path(assigns(:appointment))
  end

  test "should show appointment" do
    get :show, id: @appointment
    assert_response :success
  end

  test "should get edit" do
    login(@user)
    get :edit, id: @appointment
    assert_response :success
  end

  test "should update appointment" do
    login(@user)
    patch :update, id: @appointment, appointment: { location: 'Other location' }
    assert_redirected_to appointment_path(assigns(:appointment))
  end

  test "should destroy appointment" do
    login(@user)
    assert_difference('Appointment.current.count', -1) do
      delete :destroy, id: @appointment
    end

    assert_redirected_to appointments_path
  end
end

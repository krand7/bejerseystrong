require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  setup do
    @user = users(:regular)
    @admin = users(:admin)
    @answer = answers(:one)
  end

  test "should get index" do
    login(@admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:answers)
  end

  test "should get new" do
    login(@admin)
    get :new
    assert_response :success
  end

  test "should create answer" do
    login(@admin)
    assert_difference('Answer.count') do
      post :create, answer: { content: 'New answer', slug: 'new_answer_0', value: 0 }
    end

    assert_redirected_to answer_path(assigns(:answer))
  end

  test "should show answer" do
    login(@admin)
    get :show, id: @answer
    assert_response :success
  end

  test "should get edit" do
    login(@admin)
    get :edit, id: @answer
    assert_response :success
  end

  test "should update answer" do
    login(@admin)
    patch :update, id: @answer, answer: { content: 'New answer' }
    assert_redirected_to answer_path(assigns(:answer))
  end

  test "should destroy answer" do
    login(@admin)
    assert_difference('Answer.current.count', -1) do
      delete :destroy, id: @answer
    end

    assert_redirected_to answers_path
  end
end

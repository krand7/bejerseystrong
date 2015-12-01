require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup do
    @user = users(:regular)
    @admin = users(:admin)
    @question = questions(:one)
  end

  test "should get index" do
    login(@admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:questions)
  end

  test "should get new" do
    login(@admin)
    get :new
    assert_response :success
  end

  test "should create question" do
    login(@admin)
    assert_difference('Question.count') do
      post :create, question: { content: 'New question', display_type: 'radio', slug: 'new_question' }
    end

    assert_redirected_to question_path(assigns(:question))
  end

  test "should show question" do
    login(@admin)
    get :show, id: @question
    assert_response :success
  end

  test "should get edit" do
    login(@admin)
    get :edit, id: @question
    assert_response :success
  end

  test "should update question" do
    login(@admin)
    patch :update, id: @question, question: { content: 'New question' }
    assert_redirected_to question_path(assigns(:question))
  end

  test "should destroy question" do
    login(@admin)
    assert_difference('Question.current.count', -1) do
      delete :destroy, id: @question
    end

    assert_redirected_to questions_path
  end
end

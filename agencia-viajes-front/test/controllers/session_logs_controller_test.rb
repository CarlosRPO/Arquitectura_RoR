require 'test_helper'

class SessionLogsControllerTest < ActionController::TestCase
  setup do
    @session_log = session_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:session_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create session_log" do
    assert_difference('SessionLog.count') do
      post :create, session_log: { error_message: @session_log.error_message, logged_date: @session_log.logged_date, success: @session_log.success, user_name: @session_log.user_name }
    end

    assert_redirected_to session_log_path(assigns(:session_log))
  end

  test "should show session_log" do
    get :show, id: @session_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @session_log
    assert_response :success
  end

  test "should update session_log" do
    patch :update, id: @session_log, session_log: { error_message: @session_log.error_message, logged_date: @session_log.logged_date, success: @session_log.success, user_name: @session_log.user_name }
    assert_redirected_to session_log_path(assigns(:session_log))
  end

  test "should destroy session_log" do
    assert_difference('SessionLog.count', -1) do
      delete :destroy, id: @session_log
    end

    assert_redirected_to session_logs_path
  end
end

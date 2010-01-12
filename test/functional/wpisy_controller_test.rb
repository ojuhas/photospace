require 'test_helper'

class WpisyControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wpisy)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wpis" do
    assert_difference('Wpis.count') do
      post :create, :wpis => { }
    end

    assert_redirected_to wpis_path(assigns(:wpis))
  end

  test "should show wpis" do
    get :show, :id => wpisy(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => wpisy(:one).to_param
    assert_response :success
  end

  test "should update wpis" do
    put :update, :id => wpisy(:one).to_param, :wpis => { }
    assert_redirected_to wpis_path(assigns(:wpis))
  end

  test "should destroy wpis" do
    assert_difference('Wpis.count', -1) do
      delete :destroy, :id => wpisy(:one).to_param
    end

    assert_redirected_to wpisy_path
  end
end

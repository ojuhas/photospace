require 'test_helper'

class PhotospacesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photospaces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photospace" do
    assert_difference('Photospace.count') do
      post :create, :photospace => { }
    end

    assert_redirected_to photospace_path(assigns(:photospace))
  end

  test "should show photospace" do
    get :show, :id => photospaces(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => photospaces(:one).to_param
    assert_response :success
  end

  test "should update photospace" do
    put :update, :id => photospaces(:one).to_param, :photospace => { }
    assert_redirected_to photospace_path(assigns(:photospace))
  end

  test "should destroy photospace" do
    assert_difference('Photospace.count', -1) do
      delete :destroy, :id => photospaces(:one).to_param
    end

    assert_redirected_to photospaces_path
  end
end

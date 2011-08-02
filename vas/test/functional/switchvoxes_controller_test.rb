require 'test_helper'

class SwitchvoxesControllerTest < ActionController::TestCase
  setup do
    @incoming = incomings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:incomings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create switchvox" do
    assert_difference('Switchvox.count') do
      post :create, :incoming => @incoming.attributes
    end

    assert_redirected_to switchvox_path(assigns(:incoming))
  end

  test "should show switchvox" do
    get :show, :id => @incoming.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @incoming.to_param
    assert_response :success
  end

  test "should update switchvox" do
    put :update, :id => @incoming.to_param, :incoming => @incoming.attributes
    assert_redirected_to switchvox_path(assigns(:incoming))
  end

  test "should destroy switchvox" do
    assert_difference('Switchvox.count', -1) do
      delete :destroy, :id => @incoming.to_param
    end

    assert_redirected_to switchvoxes_path
  end
end

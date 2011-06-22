require 'test_helper'

class RsvpsControllerTest < ActionController::TestCase
  setup do
    @rsvp = rsvps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rsvps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rsvp" do
    assert_difference('Rsvp.count') do
      post :create, :rsvp => @rsvp.attributes
    end

    assert_redirected_to rsvp_path(assigns(:rsvp))
  end

  test "should show rsvp" do
    get :show, :id => @rsvp.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @rsvp.to_param
    assert_response :success
  end

  test "should update rsvp" do
    put :update, :id => @rsvp.to_param, :rsvp => @rsvp.attributes
    assert_redirected_to rsvp_path(assigns(:rsvp))
  end

  test "should destroy rsvp" do
    assert_difference('Rsvp.count', -1) do
      delete :destroy, :id => @rsvp.to_param
    end

    assert_redirected_to rsvps_path
  end
end

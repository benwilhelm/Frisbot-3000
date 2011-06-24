require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  setup do
    @player = players(:one)
    @update = {
      :fname => 'Some' ,
      :lname => 'Player' ,
      :email => 'some@player.com' ,
      :role => 'player' ,
      :password => 'password'
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:players)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player" do
    assert_difference('Player.count') do
      post :create, :player => @update
    end

    assert_redirected_to player_path(assigns(:player))
  end

  test "should show player" do
    get :show, :id => @player.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @player.to_param
    assert_response :success
  end

  test "should update player" do
    put :update, :id => @player.to_param, :player => @update
    assert_redirected_to player_path(assigns(:player))
  end

  test "should destroy player" do
    assert_difference('Player.count', -1) do
      delete :destroy, :id => @player.to_param
    end

    assert_redirected_to players_path
  end
end

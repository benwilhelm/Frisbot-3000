require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  setup do
    @user = Users.gen
    @game = games(:one)
    @update = {
      :game_time => 7.days.from_now ,
      :polling_cutoff => 6.days.from_now ,
      :location => "Winnemac Park" ,
      :min_players => 6
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game" do
    sign_in :user, @user
    assert_difference('Game.count') do
      post :create, :game => @update
    end

    assert_redirected_to game_path(assigns(:game))
  end

  test "should create rsvp for each player" do
    sign_in :user, @user
    assert_difference('Rsvp.count',User.count) do
      post :create, :game => @update
    end

    assert_redirected_to game_path(assigns(:game))
  end

  test "should show game" do
    get :show, :id => @game.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @game.to_param
    assert_response :success
  end

  test "should update game" do
    put :update, :id => @game.to_param, :game => @update
    assert_redirected_to game_path(assigns(:game))
  end

  test "should destroy game" do
    assert_difference('Game.count', -1) do
      delete :destroy, :id => @game.to_param
    end

    assert_redirected_to games_path
  end
end

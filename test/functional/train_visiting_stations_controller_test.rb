require 'test_helper'

class TrainVisitingStationsControllerTest < ActionController::TestCase
  setup do
    @train_visiting_station = train_visiting_stations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:train_visiting_stations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create train_visiting_station" do
    assert_difference('TrainVisitingStation.count') do
      post :create, train_visiting_station: { arrival_days: @train_visiting_station.arrival_days, arrival_time: @train_visiting_station.arrival_time, departure_days: @train_visiting_station.departure_days, departure_time: @train_visiting_station.departure_time, station_id: @train_visiting_station.station_id, train_id: @train_visiting_station.train_id }
    end

    assert_redirected_to train_visiting_station_path(assigns(:train_visiting_station))
  end

  test "should show train_visiting_station" do
    get :show, id: @train_visiting_station
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @train_visiting_station
    assert_response :success
  end

  test "should update train_visiting_station" do
    put :update, id: @train_visiting_station, train_visiting_station: { arrival_days: @train_visiting_station.arrival_days, arrival_time: @train_visiting_station.arrival_time, departure_days: @train_visiting_station.departure_days, departure_time: @train_visiting_station.departure_time, station_id: @train_visiting_station.station_id, train_id: @train_visiting_station.train_id }
    assert_redirected_to train_visiting_station_path(assigns(:train_visiting_station))
  end

  test "should destroy train_visiting_station" do
    assert_difference('TrainVisitingStation.count', -1) do
      delete :destroy, id: @train_visiting_station
    end

    assert_redirected_to train_visiting_stations_path
  end
end

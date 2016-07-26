class TrainVisitingStationsController < ApplicationController
  # GET /train_visiting_stations
  # GET /train_visiting_stations.json
  def index
    @train_visiting_stations = TrainVisitingStation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @train_visiting_stations }
    end
  end

  # GET /train_visiting_stations/1
  # GET /train_visiting_stations/1.json
  def show
    @train_visiting_station = TrainVisitingStation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @train_visiting_station }
    end
  end

  # GET /train_visiting_stations/new
  # GET /train_visiting_stations/new.json
  def new
    @train_visiting_station = TrainVisitingStation.new
    @stations = Station.all
    @trains = Train.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @train_visiting_station }
    end
  end

  # GET /train_visiting_stations/1/edit
  def edit
    @stations = Station.all
    @trains = Train.all
    @train_visiting_station = TrainVisitingStation.find(params[:id])
  end

  # POST /train_visiting_stations
  # POST /train_visiting_stations.json
  def create
    @train_visiting_station = TrainVisitingStation.new(params[:train_visiting_station])
    set_arrival_departure
    respond_to do |format|
      if @train_visiting_station.save
        format.html { redirect_to train_visiting_stations_path, notice: 'Train visiting station was successfully created.' }
        format.json { render json: @train_visiting_station, status: :created, location: @train_visiting_station }
      else
        format.html { render action: "new" }
        format.json { render json: @train_visiting_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /train_visiting_stations/1
  # PUT /train_visiting_stations/1.json
  def update
    @train_visiting_station = TrainVisitingStation.find(params[:id])
    set_arrival_departure
    respond_to do |format|
      if @train_visiting_station.update_attributes(params[:train_visiting_station])
        format.html { redirect_to train_visiting_stations_path, notice: 'Train visiting station was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @train_visiting_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /train_visiting_stations/1
  # DELETE /train_visiting_stations/1.json
  def destroy
    @train_visiting_station = TrainVisitingStation.find(params[:id])
    @train_visiting_station.destroy

    respond_to do |format|
      format.html { redirect_to train_visiting_stations_url }
      format.json { head :no_content }
    end
  end

  private
  def set_arrival_departure
    if params["is_start_station"]["flag"] == "1"
      @train_visiting_station.arrival_days = nil
      @train_visiting_station.arrival_time = nil
    end
    if params["is_last_station"]["flag"] == "1"
      @train_visiting_station.departure_days = nil
      @train_visiting_station.departure_time = nil
    end
  end
end

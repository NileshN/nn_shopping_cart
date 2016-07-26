class TravelController < ApplicationController

  before_filter :get_stations
  
  def index
    
  end

  def find_trains_between_stations
  	@start_station = Station.find(params["start_station"])
  	@last_station  =  Station.find(params["last_station"])
    @stations_res = [@start_station.name]
  	@stations_res << GRAPH_OBJ.shortest_path(@start_station.name, @last_station.name).reverse
    @stations_res.flatten!
  	render :action => "index"
  end

  private

  def get_stations
  	@stations = Station.all
  end
end

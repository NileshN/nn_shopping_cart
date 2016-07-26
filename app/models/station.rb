require "#{Rails.root}/lib/dijkstras.rb"
require 'priority_queue'

class Station < ActiveRecord::Base
  attr_accessible :label, :name
  
  has_many :connecting_stations, :foreign_key => :origin_station
  has_many :trains, :through => :train_visiting_stations
  has_many :train_visiting_stations
  
  def self.find_connecting_station(start_station_name, destination_station_name)
    start_station = Station.find_by_name(start_station_name)
    destination_station = Station.find_by_name(destination_station_name)
    raise "Unknown Station error" unless start_station || destination_station
    result = GRAPH_OBJ.shortest_path(start_station_name, destination_station.name)
    puts "Route to go from #{start_station_name} to #{destination_station_name} is as below:"
    puts result.reverse.inspect
  end
end

class ConnectingStation < ActiveRecord::Base
  attr_accessible :destination_station, :distance, :origin_station
  
  belongs_to :station
end

module TravelHelper

	def get_trains_to_travel(stations_res)
		output = []

    stations_res.each do |station_name|
      included = false
      station = Station.find_by_name(station_name)
      visiting_train_ids = station.trains.collect(&:code)
      included = (output.collect(&:code) & visiting_train_ids).size > 0
      unless included
        visiting_train_ids.each do |train_code|
          train = Train.find_by_code(train_code)
          visiting_station_ids = train.stations.collect(&:id)
          if visiting_station_ids.include?(station.id)
            output << train
          else
            next
          end
        end
      end
    end
    return output.uniq
	end
end

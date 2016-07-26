require "#{Rails.root}/lib/dijkstras.rb"
require 'priority_queue'

GRAPH_OBJ = Graph.new
begin
	Station.all.each do |station|
	  edges = {}
	  station.connecting_stations.each { |travel| 
	    dest_st_name = Station.find(travel.destination_station).name
	    edges.merge!(dest_st_name => travel.distance)
	  }
	  eval "GRAPH_OBJ.add_vertex('#{station.name}', #{edges})"
	end
rescue Exception => e
	puts "Exception: #{e.message}"
end
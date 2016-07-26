# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def add_distance(start_station_name, distances)
  start_station = Station.find_or_create_by_name(start_station_name)
  distances.each do |dest_st_name, distance|  
    dest_station = Station.find_or_create_by_name(dest_st_name)
    ConnectingStation.create(:origin_station => start_station.id,
                          :destination_station => dest_station.id,
                          :distance => distance)
  end
end
add_distance('Ledo',          {'NewTinsukia' => 58})
add_distance('NewTinsukia',   {'Dimapur' => 320, 'Dibrugarh' => 50, 'Guwahati' => 500, 'Ledo' => 58})
add_distance('Dimapur',       {'Guwahati' => 290, 'NewTinsukia' => 320})
add_distance('Guwahati',      {'NewTinsukia' => 500, 'Dimapur' => 290, 'Kamakhya' => 15, 'NewJalpaiguri' => 430})
add_distance('Dibrugarh',     {'NewTinsukia' => 50})
add_distance('Kamakhya',      {'Guwahati' => 15})
add_distance('NewJalpaiguri', {'Guwahati' => 430, 'Patna' => 460})
add_distance('Patna',         {'NewJalpaiguri' => 460, 'Kanpur' => 600})
add_distance('Kanpur',        {'Patna' => 600, 'Bhopal' => 570, 'Lucknow' => 100, 'NewDelhi' => 470})
add_distance('Lucknow',       {'Kanpur' => 100, })
add_distance('NewDelhi',      {'Kanpur' => 470 })
add_distance('Bhopal',        {'Kanpur' => 570, 'Delhi' => 800, 'Bhusaval' => 500, 'Nagpur' => 400})
add_distance('Delhi',         {'Bhopal' => 800 })
add_distance('Bhusaval',      {'Bhopal' => 500, 'Mumbai' => 500 })
add_distance('Nagpur',        {'Bhopal' => 400, 'Vijaywada' => 670 })
add_distance('Vijaywada',     {'Nagpur' => 670, 'Chennai' => 450 })
add_distance('Chennai',       {'Madurai' => 460, 'Guntakkal' => 450, 'Vijaywada' => 450 })
add_distance('Madurai',       {'Chennai' => 460, 'Kanyakumari' => 250})
add_distance('Guntakkal',     {'Chennai' => 450, 'Solapur' => 250})
add_distance('Kanyakumari',   {'Madurai' => 250})
add_distance('Solapur',       {'Guntakkal' => 430, 'Pune' => 250})
add_distance('Pune',          {'Solapur' => 250, 'Mumbai' => 160 })
add_distance('Mumbai',        {'Pune' => 160, 'Bhusaval' => 500 })

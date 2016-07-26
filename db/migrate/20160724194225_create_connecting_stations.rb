class CreateConnectingStations < ActiveRecord::Migration
  def change
    create_table :connecting_stations do |t|
      t.integer :origin_station
      t.integer :destination_station
      t.integer :distance

      t.timestamps
    end
  end
end

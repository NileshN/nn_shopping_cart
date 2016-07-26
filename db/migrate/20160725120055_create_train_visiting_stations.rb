class CreateTrainVisitingStations < ActiveRecord::Migration
  def change
    create_table :train_visiting_stations do |t|
      t.string :arrival_days
      t.time :arrival_time
      t.string :departure_days
      t.time :departure_time
      t.integer :station_id
      t.integer :train_id

      t.timestamps
    end
  end
end

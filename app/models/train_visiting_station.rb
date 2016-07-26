class TrainVisitingStation < ActiveRecord::Base
  belongs_to :train, :primary_key => :code
  belongs_to :station
  attr_accessible :arrival_days, :arrival_time, :departure_days, :departure_time, :station_id, :train_id

  def only_time
  	self.strftime("%I:%M%p")
  end
end

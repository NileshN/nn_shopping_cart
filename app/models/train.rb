class Train < ActiveRecord::Base
  attr_accessible :code, :label, :name

  has_many :train_visiting_stations, :primary_key => :code
  has_many :stations, :through => :train_visiting_stations
  validates_uniqueness_of :code

  def display_name
    "#{self.code} - #{self.name}"
  end
end

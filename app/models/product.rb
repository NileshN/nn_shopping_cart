class Product < ActiveRecord::Base
	validates_presence_of :name, :price
	validates_numericality_of :price

	def available?
	  self.quantity > 0
	end

	def increase_quantity
	  self.quantity += 1
	  self.save
	end

	def decrease_quantity
	  self.quantity -= 1
	  self.save
	end
end

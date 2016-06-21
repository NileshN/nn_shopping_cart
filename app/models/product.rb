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
	  if self.quantity > 0
	    self.quantity -= 1
	    self.save
	  else
	  	raise "Sorry, Product '#{self.name}' is Out of Stock at this time!"
		end
	end
end

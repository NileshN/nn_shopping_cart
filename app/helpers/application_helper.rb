module ApplicationHelper

	def only_time(full_datetime)
  	full_datetime.strftime("%I:%M%p")
  end

end

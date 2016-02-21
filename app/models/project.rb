class Project < ActiveRecord::Base

	validates_presence_of :name


	def name_with_date
		"#{name} - #{created_at}"
	end

end

class Project < ActiveRecord::Base

	validates_presence_of :name

	belongs_to :user
	has_many :notes


	def name_with_date
		"#{name} - #{created_at}"
	end

end

class Project < ActiveRecord::Base

	validates :name, presence: true

	belongs_to :user
	has_many :notes, -> { order('created_at DESC, title ASC')}, :dependent => :delete_all
	has_and_belongs_to_many :stages


	def name_with_date
		"#{name} - #{created_at}"
	end

end

class Task < ActiveRecord::Base
  belongs_to :project

  validates :subject, presence: true
  validates :description, presence: true
  
end

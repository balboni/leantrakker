class Comment < ActiveRecord::Base
  belongs_to :project

  validates :subject, presence: true
  validates :comment, presence: true
  
end

class Course < ActiveRecord::Base
	# Associations
	belongs_to :topic
	
	# Validations
	validates :topic_id, :course_title, :course_description, presence: true
end

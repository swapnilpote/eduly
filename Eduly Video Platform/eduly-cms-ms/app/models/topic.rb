class Topic < ActiveRecord::Base
	# Associations
	belongs_to :category
	has_many :courses

	# Validations
	validates :category_id, :topic_title, :topic_description, presence: true
end

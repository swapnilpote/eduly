class Category < ActiveRecord::Base
	# Associations
	has_many :topics
	# Validations
	validates :category_title, :category_description, presence: true
end

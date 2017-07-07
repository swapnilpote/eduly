class Playlist < ActiveRecord::Base

	# Associations
	belongs_to :advanced_category
	belongs_to :user
	has_many :videos

	# Validations
	validates :advanced_category_id, :playlist_title, :playlist_description, presence: true


	def to_param
		"#{id} #{playlist_title}".parameterize
	end

end

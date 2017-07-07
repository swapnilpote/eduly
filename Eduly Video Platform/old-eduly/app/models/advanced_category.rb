class AdvancedCategory < ActiveRecord::Base

	# Associations
	has_many :playlists
	
end

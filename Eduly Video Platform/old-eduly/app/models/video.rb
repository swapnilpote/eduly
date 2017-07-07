class Video < ActiveRecord::Base

	# For elasticsearch
	searchkick

	# Associations
  belongs_to :playlist

	# Validates
	validates :playlist_id, :video_title, :video_description, :keywords, :video_url, presence: true

	# Paperclip gem config
	has_attached_file :image, styles: { medium: "1280x720#", thumb: "328x185#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


	def to_param
		"#{id} #{video_title}".parameterize
	end
end

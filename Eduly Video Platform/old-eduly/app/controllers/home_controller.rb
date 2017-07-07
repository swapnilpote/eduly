class HomeController < ApplicationController

	before_action :authenticate_user

	def explore
		@playlists = Playlist.order("created_at desc").limit(3)
	end
end

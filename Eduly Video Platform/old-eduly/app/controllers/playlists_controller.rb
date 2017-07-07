class PlaylistsController < ApplicationController

	before_action :authenticate_user
	before_action :set_playlist, only: [:edit, :update, :destroy]

	def index
		if current_user.tutor == true
			@current_user_playlists = current_user.playlists
		else
			redirect_to my_channel_path, notice: 'Your are not register as tutor.'
		end
	end

	def show
		@number = 0
		@playlist = Playlist.find(params[:id])
	end

	def new
		if current_user.tutor == true
			@playlist = current_user.playlists.build
		else
			redirect_to my_channel_path, notice: 'Your are not register as tutor.'
		end
	end

	def create
		@playlist = current_user.playlists.build(playlist_params)

		if @playlist.save
			redirect_to @playlist, notice: 'New playlist has been created successfully.'
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @playlist.update(playlist_params)
			redirect_to @playlist, notice: 'Playlist has been updated successfully.'
		else
			render 'edit'
		end
	end

	def destroy
		@playlist.destroy
		redirect_to playlists_path, notice: 'Playlist has been deleted successfully.'
	end


	private
		def set_playlist
			playlist = Playlist.find(params[:id])

			if playlist.user == current_user
				@playlist = playlist
			else
				redirect_to playlists_path, notice: 'You don\'t have authority to make any changes into this playlist.'
			end
		end

		def playlist_params
			params.require(:playlist).permit(:advanced_category_id, :user_id, :playlist_title, :playlist_description)
		end
end

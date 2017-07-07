class VideosController < ApplicationController

	before_action :authenticate_user
	before_action :set_video, only: [:edit, :update, :destroy]

	def search
		if params[:search].present?
			@videos = Video.search(params[:search])
		else
			redirect_to explore_path
		end
	end

	def index
		@current_user_videos = []

		current_user.playlists.each do |playlist|
			playlist.videos.each do |video|
				@current_user_videos << video
			end
		end
	end

	def show
		@video = Video.find(params[:id])
	end

	def new
		if current_user.tutor == true
			@video = Video.new
		else
			redirect_to my_channel_path, notice: 'Your are not register as tutor.'
		end
	end

	def create
		@video = Video.new(video_params)

		if @video.save
			redirect_to @video, notice: 'Uploaded new video.'
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @video.update(video_params)
			redirect_to @video, notice: 'Updated video.'
		else
			render 'edit'
		end
	end

	def destroy
	end


	private
		def set_video
			video = Video.find(params[:id])
			playlist_video = Playlist.find(video.playlist_id)

			if playlist_video.user = current_user
				@video = video
			else
				redirect_to videos_path
			end
		end

		def video_params
			params.require(:video).permit(:playlist_id, :video_title, :video_description, :keywords, :video_url, :image)
		end
end

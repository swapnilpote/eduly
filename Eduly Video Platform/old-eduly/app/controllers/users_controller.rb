class UsersController < ApplicationController

	before_action :authenticate_user

	def show
		user = User.find(current_user)

		if user.tutor == true
			redirect_to playlists_path
		else
			@user = user
		end
	end

end

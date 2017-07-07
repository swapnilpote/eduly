class SessionsController < ApplicationController
    layout "admin_welcome"

    before_filter :user_logged_in, only: [:new]

    def new
    end

    def create
        admin_user = AdminUser.find_by_email(params[:email])

        if admin_user && admin_user.authenticate(params[:password])
            session[:admin_user_id] = admin_user.id
            redirect_to landings_path, notice: "Logged in!"
        else
            flash.now.alert = "Email or password is invalid."
            render "new"
        end
    end

    def destroy
        session[:admin_user_id] = nil
        redirect_to root_path, notice: "Logged out!"
    end
end

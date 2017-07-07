class AdminUsersController < ApplicationController

    before_filter :authorize

    def new
        @admin_user = AdminUser.new
    end

    def create
        @admin_user = AdminUser.new(admin_user_params)

        if @admin_user.save
            session[:admin_user_id] = @admin_user.id
            redirect_to root_path, notice: "Thank you for signing up!"
        else
            render "new"
        end
    end

    private
        def admin_user_params
            params.require(:admin_user).permit(:email, :password, :password_confirmation)
        end
end

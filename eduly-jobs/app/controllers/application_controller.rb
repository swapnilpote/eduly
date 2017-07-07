class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    private
        def current_user
            @current_user ||= AdminUser.find(session[:admin_user_id]) if session[:admin_user_id]
        end
        helper_method :current_user

        def authorize
            redirect_to login_path, alert: "Not authorized" if current_user.nil?
        end

        def user_logged_in
            redirect_to landings_path, alert: "Already logged in" if current_user.present?
        end
end

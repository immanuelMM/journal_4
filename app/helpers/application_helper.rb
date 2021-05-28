module ApplicationHelper
    def flash_class(level)
        bootstrap_alert_class = {
          "success" => "alert-success",
          "error" => "alert-danger",
          "notice" => "alert-info",
          "alert" => "alert-danger",
          "warn" => "alert-warning"
        }
        bootstrap_alert_class[level]
      end
    def logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if !! session[:user_id]
    end
end

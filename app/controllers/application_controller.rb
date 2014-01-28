class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  def home
  end
  
  #filter_parameter_logging :password, :password_confirmation # there are underscores :-|

  #helper_method :current_user_session, :current_user




  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:username,:first_name,:last_name,
                                             :email ,:password,:password_confirmation,:remember_me)}
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email,:password,:remember_me) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, 
                                                :password_confirmation, :current_password) }
    end



  private
    # def current_user_session
    #   return @current_user_session if defined?(@current_user_session)
    #   @current_user_session = UserSession.find
    # end

    # def current_user
    #   return @current_user if defined?(@current_user)
    #   @current_user = current_user_session && current_user_session.user
    # end

    def require_user
      logger.debug "ApplicationController::require_user"
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      logger.debug "ApplicationController::require_no_user"
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
       # redirect_to home_index_path
        return false
      end
    end

    def store_location
      #session[:return_to] = request.request_uri
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

end

# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
helper_method :current_user, :logged_in?, :owner?
rescue_from 'Acl9::AccessDenied', :with => :access_denied
private

def current_user_session
  return @current_user_session if defined?(@current_user_session)
  @current_user_session = UserSession.find
end

def current_user
  return @current_user if defined?(@current_user)
  @current_user = current_user_session && current_user_session.record
end

# to samo co current_user ale kod czytelniejszy
def logged_in?
  current_user != nil 
end
def owner?
 current_user == owner
end
# metoda wykorzystana w require_user i require_no_user
def store_location
  session[:return_to] = request.request_uri
end
helper_method :require_no_user, :redirect_back_or_default

private

def require_no_user
 if current_user
    store_location
    flash[:notice] = "You must be logged out to access this page"
    redirect_to root_url # inny uri?
    return false
  end
end

# czy ta metoda mo¿e siê do czegoœ przydaæ?
def redirect_back_or_default(default)
  redirect_to(session[:return_to] || default)
  session[:return_to] = nil
end

helper_method :require_user

private

def require_user
  unless current_user # albo bardziej zrozumiale: unless logged_in?
    store_location
    flash[:notice] = 
    redirect_to new_user_session_url
    return false
  end
end

 
filter_parameter_logging :password, :password_confirmation



def access_denied
    if current_user
      redirect_to photospaces_path
      
    else
      flash[:notice] = 'Access denied. Try to log in first.'
      redirect_to login_path
    end
  end



end

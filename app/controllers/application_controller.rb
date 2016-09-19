class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user,
                :setlist_service

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def setlist_service
    @setlist_service ||= SetlistService.new
  end
end

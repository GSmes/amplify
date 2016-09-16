class SessionsController < ApplicationController
  def create
    if user = User.find_or_create_from_auth(request.env['omniauth.auth'])
      session[:user_id] = user.id
    end
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end

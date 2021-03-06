class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    user = User1.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_name] = user.name
      redirect_to user, alert: "User logged in :D"
    else
      redirect_to login_url, alert: "Usuario o contraseña invalida!"
    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to login_url, alert: "User logged out :D"
  end
end

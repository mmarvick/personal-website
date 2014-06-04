class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate(params[:email], params[:password])
  	if user
  		session[:user_id] = user.id
  		redirect_to root_url, :notice => "Logged in!"
  	else
  		flash.now.alert = "Invalid email or password"
  		render "new"
  	end
  end

  def destroy
    if session[:user_id]
      session[:user_id] = nil
      redirect_to root_url, :notice => "Logged out"
    else
      redirect_to root_url, :notice => "You weren't logged in"
    end
  end
end

class LoginsController < ApplicationController
  def new
  end

  def create
    user = PerceptionUser.find_by_username(params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to root_url, notice: 'User logged in successfully'

    else
      flash.now.alert = 'Unsuccessful login attempt'
      render 'new'
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out'
  end

end

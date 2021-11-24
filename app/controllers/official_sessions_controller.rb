class OfficialSessionsController < ApplicationController
  layout "login"

  def new
  end

  def create
    official = Official.find_by(username: params[:username])
    if official.present? && official.authenticate(params[:password])
      session[:official_id] = official.id
      redirect_to root_path, flash: { success: "Signed in successfully!" }
    else
      flash[:danger] = "Invalid username or password"
      render :new
    end
  end

  def destroy
    session[:official_id] = nil
    redirect_to root_path, flash: { info: "Logged out!" }
  end

  private

  def signin_params
  end
end

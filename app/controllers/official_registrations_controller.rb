class OfficialRegistrationsController < ApplicationController
  layout "registration"

  def new
    @official = Official.new
  end

  def create
    @official = Official.new(user_params)
    if @official.save
      session[:official_id] = @official.id
      redirect_to official_dashboard_path, flash: { success: "Account created successfully" }
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:official).permit(:employee_id, :name, :area, :username, :password, :password_confirmation)
  end
end

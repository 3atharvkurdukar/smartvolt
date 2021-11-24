class CustomerSessionsController < ApplicationController
  layout "login"

  def new
  end

  def create
    customer = Customer.find_by(username: params[:username])
    if customer.present? && customer.authenticate(params[:password])
      session[:customer_id] = customer.id
      redirect_to customer_dashboard_path, flash: { info: "Signed in successfully!" }
    else
      flash[:danger] = "Invalid username or password"
      render :new
    end
  end

  def destroy
    session[:customer_id] = nil
    redirect_to root_path, flash: { info: "Logged out!" }
  end

  private

  def signin_params
  end
end

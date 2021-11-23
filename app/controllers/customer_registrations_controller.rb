class CustomerRegistrationsController < ApplicationController
  layout "registration"

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(user_params)
    if @customer.save
      session[:user_id] = @customer.id
      redirect_to root_path, flash: { info: "Account created successfully" }
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:customer).permit(:name, :mobileno, :username, :password, :password_confirmation)
  end
end

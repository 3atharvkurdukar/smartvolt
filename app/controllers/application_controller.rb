class ApplicationController < ActionController::Base
  before_action :set_current_customer

  def set_current_customer
    if session[:customer_id]
      Current.customer = Customer.find_by(id: session[:customer_id])
    end
  end

  def require_customer_signed_in
    redirect_to sign_in_path, flash: { danger: "You must be signed in to do that!" } if Current.customer.nil?
  end
end

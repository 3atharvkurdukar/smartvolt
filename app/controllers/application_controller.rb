class ApplicationController < ActionController::Base
  before_action :set_current_customer
  before_action :set_current_official

  def set_current_customer
    if session[:customer_id]
      Current.customer = Customer.find_by(id: session[:customer_id])
    end
  end

  def set_current_official
    if session[:official_id]
      Current.official = Official.find_by(id: session[:official_id])
    end
  end

  def require_customer_signed_in
    redirect_to customer_login_path, flash: { warning: "You must be signed in to do that!" } if Current.customer.nil?
  end

  def require_official_signed_in
    redirect_to official_login_path, flash: { warning: "You must be signed in to do that!" } if Current.official.nil?
  end
end

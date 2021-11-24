class CustomersController < ApplicationController
  before_action :require_customer_signed_in

  layout "customer"

  def index
  end
end

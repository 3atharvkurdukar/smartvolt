class CustomersController < ApplicationController
  before_action :require_customer_signed_in

  layout "customer"

  def index
    @connections = Connection.where(customer: Current.customer.id).order(name: :asc)
    @bills = Bill.joins(:connection).where(connection: { customer: Current.customer.id }).order(created_at: :desc)
  end
end

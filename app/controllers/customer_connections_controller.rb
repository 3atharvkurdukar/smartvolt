class CustomerConnectionsController < ApplicationController
  before_action :require_customer_signed_in
  layout "customer"

  def index
    @connections = Connection.where(customer: Current.customer.id).order(name: :asc)
  end

  def new
  end

  def create
    @connection = Current.customer.connections.create(connection_params)
    if @connection.connection_type == "Domestic"
      @connection.rate = 5
    end
    if @connection.connection_type == "Commercial"
      @connection.rate = 10
    end
    if @connection.connection_type == "Industrial"
      @connection.rate = 15
    end
    if @connection.save
      redirect_to customer_dashboard_path, flash: { success: "Connection added successfully" }
    else
      render :new
    end
  end

  def show
    @connection = Connection.find_by(id: params[:connection_id])
    # if !@connection.present? || @connection.customer.id != Current.customer.id
    if !@connection.present?
      redirect_to customer_dashboard_path, flash: { danger: "Invalid connection ID" }
    end
    @last_bill = Bill.where(connection_id: @connection.id).order(created_at: :desc).first
    @show_upload_link = !@last_bill.present? || @last_bill.created_at.to_date <= 1.month.ago.to_date

    @bills = Bill.where(connection: params[:connection_id]).order(created_at: :desc)
    @grievances = Grievance.where(connection: params[:connection_id]).order(created_at: :desc)
  end

  private

  def connection_params
    params.permit(:name, :address, :connection_type, :phase, :area)
  end
end

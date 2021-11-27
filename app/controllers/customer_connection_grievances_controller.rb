class CustomerConnectionGrievancesController < ApplicationController
  before_action :require_customer_signed_in
  layout "customer"

  def new
    @grievance = Grievance.new
  end

  def create
    connection = Current.customer.connections.find(params[:connection_id])
    @grievance = connection.grievances.create(grievance_params)
    official = Official.find_by(area: connection.area)
    if !official.present?
      redirect_to customer_connection_path(connection.id), flash: { danger: "No official has been allotted to the area yet. Please try again later" }
    end
    @grievance.official = official
    @grievance.status = "Pending"
    if @grievance.save
      redirect_to customer_connection_path(connection.id), flash: { success: "Grievance added successfully" }
    else
      render :new
    end
  end

  private

  def grievance_params
    params.require(:grievance).permit(:problem, :description)
  end
end

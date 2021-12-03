class OfficialGrievancesController < ApplicationController
  before_action :require_official_signed_in

  layout "official"

  def index
    @connections = Connection.where(area: Current.official.area)
    if params[:area]
      @grievances = Grievance.joins(:connection).where(connection: { area: params[:area] }).order(created_at: :desc)
    else
      @grievances = Grievance.order(created_at: :desc)
    end
  end

  def show
    @grievance = Grievance.find(params[:grievance_id])
  end

  def edit
    @grievance = Grievance.find(params[:grievance_id])
  end

  def update
    @grievance = Grievance.find(params[:grievance_id])

    if @grievance.update(grievance_params)
      @grievance.official = Current.official
      redirect_to official_dashboard_path
    else
      render :edit
    end
  end

  private

  def grievance_params
    params.require(:grievance).permit(:problem, :description, :status, :remarks)
  end
end

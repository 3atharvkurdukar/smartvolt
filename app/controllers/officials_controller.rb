class OfficialsController < ApplicationController
  before_action :require_official_signed_in

  layout "official"

  def index
    @connections = Connection.where(area: Current.official.area )
    @bills = Bill.where(connection: [@connections], status: "Image Uploaded").order(created_at: :desc)
    @grievances = Grievance.where(connection: [@connections],status:["Pending", "Work in Progress"]).order(created_at: :desc)
  end
end

class OfficialsController < ApplicationController
  before_action :require_official_signed_in

  layout "official"

  def index
    @bills = Bill.where(official_id: Current.official.id, status: "Image Uploaded").order(created_at: :desc)
    @grievances = Grievance.where(official_id: Current.official.id).order(created_at: :desc)
  end
end

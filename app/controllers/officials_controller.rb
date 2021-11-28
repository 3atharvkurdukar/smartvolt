class OfficialsController < ApplicationController
  before_action :require_official_signed_in

  layout "official"

  def index
    @bills=Bill.all
    @grievances=Grievance.where(official_id: Current.official.id)
  end
end

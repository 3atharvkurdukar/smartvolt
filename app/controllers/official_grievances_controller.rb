class OfficialGrievancesController < ApplicationController

    before_action :require_official_signed_in

    layout "official"
  
    def index
        @grievances=Grievance.where(official_id: Current.official.id).order(created_at: :desc)
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

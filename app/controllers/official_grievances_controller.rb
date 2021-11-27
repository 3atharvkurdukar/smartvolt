class OfficialGrievancesController < ApplicationController

    before_action :require_official_signed_in

    layout "official"
  
    def index
        @grievances=Grievance.where(official_id: Current.official.id)
    end

   def show


    
    @grievance = Grievance.find(params[:grievance_id])

    

   end


   private

  

end

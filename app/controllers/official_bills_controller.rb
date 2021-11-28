class OfficialBillsController < ApplicationController

    before_action :require_official_signed_in

    layout "official"
  
    def index
        @bills=Bill.all
    end



end

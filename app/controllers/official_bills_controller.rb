class OfficialBillsController < ApplicationController

    before_action :require_official_signed_in

    layout "official"
  
    def index
        @customers = Customer.all
        @official=Official.all
    end



end

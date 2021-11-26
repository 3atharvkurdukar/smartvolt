class CustomerConnectionsController < ApplicationController
    before_action :require_customer_signed_in
    layout "customer"
    def index
        
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
        private
        def connection_params
               params.permit(:name, :address, :connection_type,:phase,:area)
               
        end
end

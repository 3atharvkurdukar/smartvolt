class OfficialBillsController < ApplicationController
  before_action :require_official_signed_in

  layout "official"

  def index
    @connections = Connection.where(area: Current.official.area )
    @bills = Bill.where(connection: [@connections]).order(created_at: :desc)
  end

  def show
    @bill = Bill.find(params[:bill_id])
  end

  def edit
    @bill = Bill.find(params[:bill_id])
  end

  def update
    @bill = Bill.find(params[:bill_id])

    if @bill.update(bill_params)
      unit = @bill.curr_reading - @bill.prev_reading
      if @bill.update(units: unit)
        amount = (@bill.connection.rate) * @bill.units
      end
      if @bill.update(amount: amount)
        @bill.update(status: "Bill Generated")
        @bill.official = Current.official
      end
      redirect_to official_bill_path(@bill.id)
    else
      render :edit
    end
  end

  private

  def bill_params
    params.require(:bill).permit(:prev_reading, :curr_reading, :status, :units, :amount)
  end
end

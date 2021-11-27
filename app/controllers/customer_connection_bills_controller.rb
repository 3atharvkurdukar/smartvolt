class CustomerConnectionBillsController < ApplicationController
  before_action :require_customer_signed_in
  layout "customer"

  def new
    @bill = Bill.new
  end

  def create
    connection = Connection.find_by(id: params[:connection_id])
    @bill = connection.bills.create(params[:image])
    official = Official.find_by(area: connection.area)
    if !official.present?
      redirect_to customer_connection_path(connection.id), flash: { danger: "No official has been allotted to the area yet. Please try again later" }
    end
    prev_bill = Bill.where(connection: connection).order(created_at: :desc).first
    if prev_bill.present?
      @bill.prev_reading = prev_bill.curr_reading
    else
      @bill.prev_reading = 0
    end
    @bill.official = official
    @bill.status = "Image Uploaded"
    if @bill.save
      redirect_to customer_connection_path(connection.id), flash: { success: "Image uploaded successfully" }
    else
      render :new
    end
  end

  def show
  end
end

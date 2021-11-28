class CustomerConnectionBillsController < ApplicationController
  before_action :require_customer_signed_in
  layout "customer"

  def new
    @bill = Bill.new
    connection = Connection.find_by(id: params[:connection_id])
    TwilioOtpSend.new(connection.customer.mobileno).sendOTP
    flash.now[:info] = "An OTP has been sent to your registered mobile number!"
  end

  def create
    puts params[:otp].to_s + "ABCDE"
    puts params[:connection_id]
    connection = Connection.find_by(id: params[:connection_id])
    official = Official.find_by(area: connection.area)
    if !official.present?
      redirect_to customer_connection_path(connection.id), flash: { danger: "No official has been allotted to the area yet. Please try again later" }
    end

    @bill = Bill.new
    @bill.connection = connection
    @bill.image = params[:image]
    @bill.official = official
    @bill.status = "Image Uploaded"

    prev_bill = connection.bills.last
    if prev_bill.present?
      @bill.prev_reading = prev_bill.curr_reading
    else
      @bill.prev_reading = 0
    end

    response = TwilioOtpVerify.new(connection.customer.mobileno, params[:otp]).verify
    if response.status == "approved"
      if @bill.save
        redirect_to customer_connection_path(connection.id), flash: { success: "Image uploaded successfully" }
      else
        redirect_to customer_connection_path(connection.id), flash: { danger: "Unable to upload image!" }
      end
    else
      redirect_to customer_connection_path(connection.id), flash: { danger: "Invalid OTP!" }
    end
  end

  def show
    connection = Current.customer.connections.find(params[:connection_id])
    @bill = connection.bills.find(params[:bill_id])
  end
end

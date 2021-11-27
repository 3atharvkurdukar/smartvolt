class TwilioOtpSend
  attr_reader :mobileno

  def initialize(mobileno)
    @mobileno = "+91" + mobileno.to_s
  end

  def sendOTP
    client = Twilio::REST::Client.new
    client.verify
          .services(ENV.fetch("TWILIO_OTP_SID"))
          .verifications
          .create(to: @mobileno, channel: "sms")
  end
end

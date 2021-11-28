class TwilioOtpVerify
  attr_reader :mobileno
  attr_reader :otp

  def initialize(mobileno, otp)
    @mobileno = "+91" + mobileno.to_s
    @otp = otp.to_s
  end

  def verify
    client = Twilio::REST::Client.new
    client.verify
          .services(ENV.fetch("TWILIO_OTP_SID"))
          .verification_checks
          .create(to: @mobileno, code: @otp)
  end
end

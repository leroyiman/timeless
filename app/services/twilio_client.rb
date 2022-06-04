class TwilioClient
  attr_reader :client

  def initialize
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def account_sid
    ENV['account_sid']
  end


  def auth_token
    ENV['auth_token']
  end
end

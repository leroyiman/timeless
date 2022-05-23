Mailjet.configure do |config|
  config.api_key = ENV['MAILJET_URL']
  config.secret_key = ENV['MAILJET_SECRET_URL']
  config.api_version = "v3.1"
end

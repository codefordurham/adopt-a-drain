# Load the Rails application.
require File.expand_path('../application', __FILE__)

ActionMailer::Base.smtp_settings = {
  address: ENV['MAILSERVER_HOST'],
  port: '587',
  authentication: :plain,
  user_name: ENV['MAILSERVER_USERNAME'],
  password: ENV['MAILSERVER_PASSWORD'],
  domain: ENV['MAILSERVER_DOMAIN'],
  enable_starttls_auto: true,
}

# Initialize the Rails application.
Rails.application.initialize!

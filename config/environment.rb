# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
ENV['TRACKING_DATABASE_USER']="trackinguser"
ENV['TRACKING_DATABASE_PASSWORD']="imhelping"

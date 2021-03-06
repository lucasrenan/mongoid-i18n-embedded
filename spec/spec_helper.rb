begin
  require "simplecov"
  SimpleCov.start("rails") do
    add_filter "/vendor/"
  end
rescue
end

# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"
require "rspec/rails"

ActionMailer::Base.delivery_method = :test
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.default_url_options[:host] = "test.com"

Rails.backtrace_cleaner.remove_silencers!

# Configure capybara for integration testing
require "capybara/rails"
Capybara.default_driver   = :rack_test
Capybara.default_selector = :css

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  # Remove this line if you don"t want RSpec"s should and should_not
  # methods or matchers
  require "rspec/expectations"
  config.include RSpec::Matchers

  # == Mock Framework
  config.mock_with :rspec

  config.color_enabled = true
  config.full_backtrace = true

  config.after :each do    
    Mongoid.master.collections.select {|c| c.name !~ /^system/ }.each(&:drop)
  end

  config.after(:suite) do
    Mongoid.master.connection.drop_database("#{Mongoid.master.name}")
  end
end

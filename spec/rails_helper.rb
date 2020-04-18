# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'capybara'

require 'support/database_cleaner'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
end

require 'shoulda/matchers'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

def create_new_user_and_login
  visit('/users/sign_up')
  fill_in 'Name', with: 'Ramesh'
  fill_in 'Email', with: 'ramesh@test.com'
  fill_in 'Password', with: 'ramesh'
  fill_in 'Password confirmation', with: 'ramesh'
  click_button 'Sign up'
end

def create_second_user_and_login
  visit('/users/sign_up')
  fill_in 'Name', with: 'hamesh'
  fill_in 'Email', with: 'hamesh@test.com'
  fill_in 'Password', with: 'hamesh'
  fill_in 'Password confirmation', with: 'hamesh'
  click_button 'Sign up'
end

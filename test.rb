=begin 
-- Gems to bundle in for RSpec:
gem 'rspec-rails' 
- testing framework with more flexibility to create and work with edge issues

gem 'factory_bot_rails' 
- using factories instead of fixtures for test data, which also makes it easier to handle. I would added a factory_bot.rb support file to spec > support folder to ensure it's method syntax are include in spec support.

gem 'database_cleaner' 
- if the log was coming from a database I might also use database_cleaner as to clean up our database between tests, which can become an issue.

  gem 'shoulda-matchers' 
- it is a one liner matches for common rails tests. It also needs to be added and set up in a spec > support folder, like factory_bot to ensure it's method syntax are include in spec support. 
=end


# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Incubadora::Application.configure do
  config.less.paths << File.join(Rails.root, 'app', 'assets', 'less')
  config.less.paths << "#{Rails.root}/lib/less/protractor/stylesheets"
  config.less.compress = true
end
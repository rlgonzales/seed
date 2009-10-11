# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.3' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')
require File.join(File.dirname(__FILE__), '../vendor/plugins/engines/boot')

Rails::Initializer.run do |config|
  
  config.plugin_paths += ["#{RAILS_ROOT}/vendor/plugins/seed"]

  config.gem 'mislav-will_paginate', :version => '~> 2.3.2', :lib => 'will_paginate', 
      :source => 'http://gems.github.com'
  
  #additional required gems
  config.gem "RedCloth", :version => ">= 3.301", :source => "http://code.whytheluckystiff.net/"
  config.gem "calendar_date_select", :version => '~> 1.15', :source => 'http://gems.github.com'

  config.time_zone = 'UTC'

  config.action_controller.session = {
    :session_key => '_seed_session',
    :secret      => 'e7468ab1ba86e131951e2ac04bb6cce2165f85d7c238447aa822a703c8776bd84a4a980b6549c6129ba4e30effaf5ccb123cfa094c2c8522e796b67c209f7df8'
  }

  config.action_controller.session_store = :active_record_store

  config.active_record.observers = :user_observer
  
  config.load_paths << "#{RAILS_ROOT}/app/sweepers"
end

ActionController::Base.prepend_view_path("vendor/plugins/#{APP_CONFIG[:app_name]}_engine/app/views")

require 'seed_stylesheets'

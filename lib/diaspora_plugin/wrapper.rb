
module Diaspora
  
  @@application = nil
  
  # Should be called on config/initializers
  #
  def self.initialize!    
    #configure paths
    self.configure_autoloads!
    
    #change root path
    Diaspora.wrap_environment do
      
      require ENV['DIASPORA_HOME'] + '/lib/diaspora'
      
      Dir[ File.join(ENV['DIASPORA_HOME'], '/config/initializers/**/*.rb') ].each do |file|
        require file
      end
    end
  end
  
  @@autloads_initialized = false
  def self.configure_autoloads!
    return if @@autloads_initialized
    @@autloads_initialized = true
    
    ::Rails.application.config.helpers_paths       += %W{#{ENV['DIASPORA_HOME']}/app/helpers}
    ::Rails.application.config.assets.paths        += %W{#{ENV['DIASPORA_HOME']}/app/assets/images #{ENV['DIASPORA_HOME']}/app/assets/javascripts #{ENV['DIASPORA_HOME']}/app/assets/stylesheets #{ENV['DIASPORA_HOME']}/app/assets/templates #{ENV['DIASPORA_HOME']}/vendor/assets/javascripts #{ENV['DIASPORA_HOME']}/vendor/assets/stylesheets #{ENV['DIASPORA_HOME']}/lib/assets/javascripts }
    ActionController::Base.prepend_view_path          "#{ENV['DIASPORA_HOME']}/app/views"
    
    autoload_path(
    %W{#{ENV['DIASPORA_HOME']}/lib
      #{ENV['DIASPORA_HOME']}/vendor
      #{ENV['DIASPORA_HOME']}/app
      #{ENV['DIASPORA_HOME']}/app/assets
      #{ENV['DIASPORA_HOME']}/app/controllers
      #{ENV['DIASPORA_HOME']}/app/helpers
      #{ENV['DIASPORA_HOME']}/app/mailers
      #{ENV['DIASPORA_HOME']}/app/models
      #{ENV['DIASPORA_HOME']}/app/presenters
      #{ENV['DIASPORA_HOME']}/app/uploaders
      #{ENV['DIASPORA_HOME']}/app/workers
      })
  end

  #
  # Called on config/application.rb definition
  #   Include Diaspora::Application on application
  #
  def self.configure_application(application_class)    
    # Diaspora Application
    require ENV['DIASPORA_HOME'] + '/config/application.rb'
  end
  
  
  #  
  #  Called on config/environment application file
  #
  def self.initialize_environment!
    self.wrap_environment  {  require File.join(ENV['DIASPORA_HOME'], 'config', 'environment'); }
  end
  
  def self.autoload_path(paths)
    paths.each do |path|
      $LOAD_PATH.unshift(path) if File.exists?(path)
    end
    ::Rails.application.config.autoload_paths += paths
    ActiveSupport::Dependencies.autoload_paths += paths
  end
  
  #
  # Changed Environment Classes and Modules
  #
  
  # Change Root path
  #
  def self.wrap_environment
    ::Rails.module_eval { def self.root; Pathname.new(ENV['DIASPORA_HOME']); end }    
    yield
    ::Rails.module_eval { def self.root; application && application.config.root; end }        
  end  
end

require 'diaspora_plugin/mocks'

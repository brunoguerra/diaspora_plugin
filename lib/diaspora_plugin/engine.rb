require 'pathname'
require 'bootstrap-sass'
require 'compass-rails'
require 'handlebars_assets'
require 'jquery-rails'
require 'mobile-fu'

module DiasporaPlugin
  class Engine < ::Rails::Engine
    isolate_namespace DiasporaPlugin
    
    initializer "diaspora" do |app|
      config.autoload_paths      += 
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
        }
      config.autoload_once_paths += %W{#{ENV['DIASPORA_HOME']}/lib}
      
      ActionController::Base.send :include, ActionController::MobileFu
      
       config.generators do |g|
         g.template_engine :haml
         g.test_framework  :rspec
       end

      config.encoding = "utf-8"
    end
  end
end

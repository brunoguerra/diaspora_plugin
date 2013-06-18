require 'pathname'
require 'bootstrap-sass'
require 'compass-rails'
require 'handlebars_assets'
require 'jquery-rails'


module DiasporaPlugin
  class Engine < ::Rails::Engine
    isolate_namespace DiasporaPlugin
    
    initializer "diaspora" do |app|
      config.autoload_paths      += %W{#{ENV['DIASPORA_HOME']}/app/presenters #{ENV['DIASPORA_HOME']}/app}
      config.autoload_once_paths += %W{#{ENV['DIASPORA_HOME']}/lib}

       config.generators do |g|
         g.template_engine :haml
         g.test_framework  :rspec
       end

      config.encoding = "utf-8"
    end
  end
end

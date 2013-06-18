
module Diaspora
  module Rails
    class Application
      def self.inherited(base)
      end      
    end
    
    def self.application
      ::Rails.application
    end
  end
  
  class Application < Rails::Application
    def self.config
      ::Rails.application.config
    end
    
    def self.initialize!
      Diaspora.default_root
      ::Rails.application.initialize!
    end
    
    def self.routes
      ::Rails.application.routes
    end
    
    def self.configure(*args, &block)
      ::Rails.application.class.configure(*args, &block)
    end
  end
  
  def self.initialize!
    Diaspora.diaspora_env do
      
      require ENV['DIASPORA_LIB'] + '/diaspora'
      
      Dir[ File.join(ENV['DIASPORA_HOME'], '/config/initializers/**/*.rb') ].each do |file|
        require file
      end

    end
  end
  
  def self.diaspora_env(*args, &block)
    
    ::Rails.application.config.autoload_paths      += %W{#{ENV['DIASPORA_HOME']}/app/presenters #{ENV['DIASPORA_HOME']}/app #{ENV['DIASPORA_HOME']}/app/models #{ENV['DIASPORA_HOME']}/app/controllers #{ENV['DIASPORA_HOME']}/app/helpers }
    ::Rails.application.config.autoload_once_paths += %W{#{ENV['DIASPORA_HOME']}/lib}
    ActionController::Base.prepend_view_path "#{ENV['DIASPORA_HOME']}/app/views"
    ::Rails.application.config.helpers_paths += %W{#{ENV['DIASPORA_HOME']}/app/helpers}
    ::Rails.application.config.assets.paths += %W{#{ENV['DIASPORA_HOME']}/app/assets/images #{ENV['DIASPORA_HOME']}/app/assets/javascripts #{ENV['DIASPORA_HOME']}/app/assets/stylesheets #{ENV['DIASPORA_HOME']}/app/assets/templates #{ENV['DIASPORA_HOME']}/vendor/assets/javascripts #{ENV['DIASPORA_HOME']}/vendor/assets/stylesheets #{ENV['DIASPORA_HOME']}/lib/assets/javascripts }
    
    ENV['DIASPORA_LIB'] ||= ENV['DIASPORA_HOME'] + '/lib'
    $LOAD_PATH << ENV['DIASPORA_LIB']

    
    ::Rails.module_eval do
      def self.root
        Pathname.new(ENV['DIASPORA_HOME'])
      end
    end
    yield
    self.default_root
  end
  
  def self.default_root
    ::Rails.module_eval do
      def self.root
        application && application.config.root
      end
    end
  end
  
end
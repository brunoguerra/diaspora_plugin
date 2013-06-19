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
      ::Rails.application.initialize!
    end

    def self.routes
      ::Rails.application.routes
    end

    def self.configure(*args, &block)
      ::Rails.application.class.configure(*args, &block)
    end
  end
end
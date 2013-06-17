$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "diaspora_plugin/version"

# Describe your s.add_dependency and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "diaspora_plugin"
  s.version     = DiasporaPlugin::VERSION
  s.authors     = ["Bruno Guerra"]
  s.email       = ["brunoit@gmail.com"]
  s.homepage    = "brunoguerra.woese.com"
  s.summary     = "Make your network over D*"
  s.description = "Customize D* to you needs."

  s.files = Dir["{app,config,db,lib}/**/*","../diaspora/{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.13"


  # Appserver

  s.add_dependency 'unicorn', '4.6.2'#, :require => false

  # API and JSON

  s.add_dependency 'acts_as_api', '0.4.1'
  s.add_dependency 'json',        '1.7.7'

  # Authentication

  s.add_dependency 'devise', '2.1.3'

  # Background processing

  s.add_dependency 'sidekiq', '2.11.1'
  s.add_dependency 'sinatra', '1.3.3'
  s.add_dependency 'slim', '1.3.8'

  # Configuration

  s.add_dependency 'configurate', '0.0.7'

  # Cross-origin resource sharing

  s.add_dependency 'rack-cors', '0.2.7'#, :require => 'rack/cors'

  # Database

  #ENV['DB'] ||= 'mysql'

  #s.add_dependency 'mysql2', '0.3.11' if ENV['DB'] == 'all' || ENV['DB'] == 'mysql'
  #s.add_dependency 'pg',     '0.15.1' if ENV['DB'] == 'all' || ENV['DB'] == 'postgres'

  s.add_dependency 'activerecord-import', '0.3.1'
  s.add_dependency 'foreigner',           '1.4.1'

  # File uploading

  s.add_dependency 'carrierwave', '0.8.0'
  s.add_dependency 'fog',         '1.10.1'
  s.add_dependency 'mini_magick', '3.5'
  s.add_dependency 'remotipart',  '1.0.5'

  # Localization

  s.add_dependency 'http_accept_language', '1.0.2'
  s.add_dependency 'i18n-inflector-rails', '~> 1.0'
  s.add_dependency 'rails-i18n',           '0.7.3'

  # Mail

  s.add_dependency 'markerb',             '1.0.1'
  s.add_dependency 'messagebus_ruby_api', '1.0.3'

  # Parsing

  s.add_dependency 'nokogiri',       '1.5.9'
  s.add_dependency 'rails_autolink', '1.0.9'
  s.add_dependency 'redcarpet',      '2.2.2'
  s.add_dependency 'roxml',          '3.1.6'
  s.add_dependency 'ruby-oembed',    '0.8.8'

  # Services

  s.add_dependency 'omniauth',          '1.1.4'
  s.add_dependency 'omniauth-facebook', '1.4.1'
  s.add_dependency 'omniauth-tumblr',   '1.1'
  s.add_dependency 'omniauth-twitter',  '0.0.16'
  s.add_dependency 'twitter',           '4.6.2'

  # Tags

  s.add_dependency 'acts-as-taggable-on', '2.4.0'

  # URIs and HTTP

  s.add_dependency 'addressable',        '2.3.4'#, :require => 'addressable/uri'
  s.add_dependency 'faraday',            '0.8.7'
  s.add_dependency 'faraday_middleware', '0.9.0'
  s.add_dependency 'typhoeus',           '0.3.3'

  # Views

  s.add_dependency 'client_side_validations', '3.2.5'
  s.add_dependency 'gon',                     '4.1.0'
  s.add_dependency 'haml',                    '4.0.2'
  s.add_dependency 'mobile-fu',               '1.1.1'
  s.add_dependency 'will_paginate',           '3.0.4'


  ### GROUPS ####

  #group :assets do

    # CSS

    s.add_dependency 'bootstrap-sass', '2.2.2.0'
    s.add_dependency 'compass-rails',  '1.0.3'
    s.add_dependency 'sass-rails',     '3.2.6'

    # Compression

    s.add_dependency 'uglifier', '2.0.1'

    # JavaScript

    s.add_dependency 'handlebars_assets', '0.12.0'
    s.add_dependency 'jquery-rails',      '2.1.4'

    # Windows and OSX have an execjs compatible runtime built-in, Linux users should
    # install Node.js or use 'therubyracer'.
    #
    # See https://github.com/sstephenson/execjs#readme for more supported runtimes

    # s.add_dependency 'therubyracer', :platform => :ruby
  #end

  #group :production do # we don't install these on travis to speed up test runs

    # Administration

    s.add_dependency 'rails_admin', '0.4.7'

    # Analytics

    s.add_dependency 'rack-google-analytics', '0.11.0'#, :require => 'rack/google-analytics'
    s.add_dependency 'rack-piwik',            '0.2.2'#,  :require => 'rack/piwik'

    # Click-jacking protection

    s.add_dependency 'rack-protection', '1.2'

    # Process management

    s.add_dependency 'foreman', '0.62'

    # Redirects

    s.add_dependency 'rack-rewrite', '1.3.3'#, :require => false
    s.add_dependency 'rack-ssl',     '1.3.3'#, :require => 'rack/ssl'

    # Third party asset hosting

    s.add_dependency 'asset_sync', '0.5.4'#, :require => false
  #end

  #group :development do
    # Comparison images

    s.add_dependency 'rmagick', '2.13.2'#, :require => false

    # Automatic test runs

    s.add_development_dependency 'guard-cucumber', '1.4.0'
    s.add_development_dependency 'guard-rspec',    '2.5.3'
    s.add_development_dependency 'rb-fsevent',     '0.9.3'#, :require => false
    s.add_development_dependency 'rb-inotify',     '0.9.0'#, :require => false

    # Preloading environment

    s.add_dependency 'guard-spork', '1.5.0'
    s.add_dependency 'spork',       '1.0.0rc3'
  #end

  #group :test do
    # RSpec (unit tests, some integration tests)

    s.add_development_dependency 'fixture_builder', '0.3.5'
    s.add_development_dependency 'fuubar',          '1.1.0'
    s.add_development_dependency 'rspec-instafail', '0.2.4'#, :require => false

    # Cucumber (integration tests)

    s.add_development_dependency 'capybara',           '1.1.3'
    s.add_development_dependency 'database_cleaner',   '0.9.1'
    s.add_development_dependency 'selenium-webdriver', '2.32.1'

    # General helpers

    s.add_development_dependency 'factory_girl_rails', '4.2.1'
    s.add_development_dependency 'timecop',            '0.6.1'
    s.add_development_dependency 'webmock',            '1.8.11'#, :require => false
  #end


  #group :development, :test do
    # RSpec (unit tests, some integration tests)
    s.add_development_dependency "rspec-rails",     '2.13.0'

    # Cucumber (integration tests)
    s.add_development_dependency 'cucumber-rails',     '1.3.1'#, :require => false

    # Jasmine (client side application tests (JS))
    s.add_development_dependency 'jasmine', '1.3.2'
    s.add_development_dependency 'sinon-rails',	    '1.4.2.1'
  #end



end

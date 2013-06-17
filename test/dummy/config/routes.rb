Rails.application.routes.draw do

  mount DiasporaPlugin::Engine => "/diaspora_plugin"
end

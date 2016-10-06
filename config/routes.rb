Rails.application.routes.draw do

  root :to => 'dashboards#index'
  get 'dashboards/index'
  get '/images/:name.:ext', :to => redirect('/assets/%{name}.%{ext}')
  get '/fonts/:name.:ext', :to => redirect('/assets/%{name}.%{ext}')

end
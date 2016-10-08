Rails.application.routes.draw do

  get 'login', to: 'logins#new', as: 'login'
  get 'logout', to: 'logins#destroy', as: 'logout'

  resources :logins
  resources :perception_users

  root :to => 'dashboards#index'
  get 'dashboards/index'

  get '/images/:name.:ext', :to => redirect('/assets/%{name}.%{ext}')
  get '/fonts/:name.:ext', :to => redirect('/assets/%{name}.%{ext}')

end
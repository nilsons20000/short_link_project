Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post '/encode', to: 'links#encode'
  post '/decode', to: 'links#decode'


end

Rails.application.routes.draw do
  # get 'links/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #  root "links#index"

  post '/encode', to: 'links#encode'
  post '/decode', to: 'links#decode'

 


end

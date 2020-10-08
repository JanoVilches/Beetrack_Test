Rails.application.routes.draw do
  
  get '/show', to: 'vehicles_map#show'
  post '/api/v1/gps', to: 'json_api#new_waypoint'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end

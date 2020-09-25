Rails.application.routes.draw do
  root to: 'players#index'
  post '/mark_indicator', to: 'player_indicators#create'
  get '/check_indicator', to: 'player_indicators#check'
end

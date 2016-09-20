Rails.application.routes.draw do
  root "home#index"

  get '/auth/spotify', as: :login
  get '/auth/spotify/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/search', to: 'search#index'
  get '/setlists', to: 'setlists#index'
  post '/playlists', to: 'playlists#create'
end

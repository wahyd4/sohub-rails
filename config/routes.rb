SohubRails::Application.routes.draw do

  root 'home#index'

  get '/hubs' => 'hubs#index'


  resource :messages


  get '/messages/:type' => 'messages#show_by_type'

  get '/calendar' => 'calendar#index'

  get '/sohub' => 'admin#index'

  get '/login', to: "sessions#new"
  get '/signup', to: "sessions#signup"

  get '/auth/weibo/callback', to: "sessions#weibo"

  get "/auth/:provider/callback", to: "sessions#create"
  get "/auth/failure", to: "sessions#failure"
  get "/logout", to: "sessions#destroy", :as => "logout"

  resources :identities
end

SohubRails::Application.routes.draw do

  root 'home#index'

  get '/hubs/' => 'hubs#index'

  #resource :messages


  get '/messages/:type' => 'messages#show_by_type'

  get '/calendar' => 'calendar#index'

  get '/admin' => 'admin#index'

  get '/login', to: "sessions#new"
  get '/signup', to: "sessions#signup"

  get '/success', to: "sessions#success"

  #get '/auth/weibo/callback', to: "sessions#weibo"

  match "/auth/:provider/callback", to: "sessions#create", :via => [:get, :post]
  get "/auth/failure", to: "sessions#failure"
  get "/logout", to: "sessions#destroy", :as => "logout"

  get '/weibo', to: "weibo#index"

  get '/weixin/query', to: "weixin#verify"

  post '/weixin/query', to: "weixin#query"


  get '/hubs/mine', to: "hubs#my_list"

  resources :identities
  resources :hubs
  #resources :images
end

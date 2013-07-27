SohubRails::Application.routes.draw do

  root 'home#index'

  get '/hubs' => 'hubs#index'


  resource :messages

  get '/messages/:type' => 'messages#show_by_type'
end

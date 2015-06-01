Spree::Core::Engine.routes.draw do


  # Add your extension routes here

  resources :babes

  get '/build_your_babe' => 'babes#new'
  get '/her_items/:id' => "home#my_babes_items" , as: 'her_items'
  #get '/my_babes_items' => "home#my_babes_items"
  get "/babes_items" => "home#babes_items"
  post "/babes_items" => "home#babes_items"


end

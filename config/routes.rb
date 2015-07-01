Spree::Core::Engine.routes.draw do


  # Add your extension routes here

  resources :babes

  get '/build_your_babe' => 'babes#new'
  get '/my_babes_package_list/:id' => 'taxons#my_babes_package_list', as: 'my_babes_items'

end

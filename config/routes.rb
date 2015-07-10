Spree::Core::Engine.routes.draw do


  # Add your extension routes here

  resources :babes

  get '/build_your_babe' => 'babes#access_concierge'
  get '/my_babes_package_list/:id' => 'taxons#my_babes_package_list', as: 'my_babes_package_list'

end

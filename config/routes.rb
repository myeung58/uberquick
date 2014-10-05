Rails.application.routes.draw do
  root 'main#index'
  get '/get_price' => "main#get_price"
  get '/make_payment' => 'main#make_payment'
  get '/store_venmo_key' => 'main#store_venmo_key'
  get '/get_venmo_info' => 'main#get_venmo_info'
  # resources :products
end



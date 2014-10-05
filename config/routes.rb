Rails.application.routes.draw do
  root 'main#index'
  get '/get_uber_price' => "main#get_uber_price"
  get '/venmo_signin' => 'main#venmo_signin'
  get '/store_venmo_key' => 'main#store_venmo_key'
  get '/make_payment' => 'main#make_payment'
  post '/api/v1/checkout/:args' => 'main#receive'

  get '/checkout' => 'main#checkout'
end



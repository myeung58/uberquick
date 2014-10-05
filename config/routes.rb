Rails.application.routes.draw do
  root 'main#index'
  get '/get_price' => "main#get_price"
  resources :products
end

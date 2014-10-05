class MainController < ApplicationController

  def index
    # render nothing: true
  end

  def receive
    p params
    google = Google::Client.new()

    $store_location = google.get_latlong('2332 Fulton St, San Francisco, Ca')['results'][0]['geometry']['location']
    $destination = google.get_latlong('225 Bush St, San Francisco, Ca')['results'][0]['geometry']['location']
    p $store_location
    p $destination
    redirect_to '/get_uber_price'
  end

  def get_uber_price
    start_latitude = $store_location[0]
    start_longitude = $store_location[1]
    end_latitude = $destination[0]
    end_longitude = $destination[1]

    @price = `curl -H 'Authorization: Token iX8OckHYwVA2KGjwlUQZE8LQAb45OfPxu3Hf1pSf' \
"https://api.uber.com/v1/estimates/price?start_latitude=37.7860099&start_longitude=-122.4025387&end_latitude=37.7758179&end_longitude=-122.4180285"`
    $price_info = JSON.parse(@price)
    redirect_to '/checkout'
  end

  def store_venmo_key
    p params
    $key = params[:access_token]
    redirect_to '/make_payment'
  end

  def venmo_signin
    redirect_to "https://api.venmo.com/v1/oauth/authorize?client_id=2016&scope=make_payments%20access_profile"
  end

  def make_payment
    venmo = Venmo::Client.new($key)
    p venmo.pay
    # @page = venmo.me
    # puts venmo.me
    # render partial: "page"
    redirect_to '/receipt'
  end

  def checkout
    @store_address = '2332 Fulton St, San Francisco, Ca'
    @destination = '225 Bush St, San Francisco, Ca'
    # render order info

    # render uber info
    @price = $price_info
  end

  def receipt

  end
end



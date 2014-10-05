class MainController < ApplicationController

  def index
    p params
    render nothing: true
  end

  def get_price
    p params
    start_latitude = params[:start_latitude]
    start_longitude = params[:start_longitude]
    end_latitude = params[:end_latitude]
    end_longitude = params[:end_longitude]

    @price = `curl -H 'Authorization: Token iX8OckHYwVA2KGjwlUQZE8LQAb45OfPxu3Hf1pSf' \
"https://api.uber.com/v1/estimates/price?start_latitude=37.7860099&start_longitude=-122.4025387&end_latitude=37.7758179&end_longitude=-122.4180285"`
    render json: @price
  end

  def store_venmo_key
    $key = params[:access_token]
    redirect_to '/'
  end

  def make_payment
    redirect_to "https://api.venmo.com/v1/oauth/authorize?client_id=2016&scope=make_payments%20access_profile"
  end

  def get_venmo_info
    venmo = Venmo::Client.new($key)
    @page = venmo.me
    puts venmo.me
    render partial: "page"
  end
end

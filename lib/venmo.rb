require 'httparty'

module Venmo
  class Client
    include HTTParty
    base_uri 'api.venmo.com/v1'

    def initialize(key)
      @key = key
    end

    def authorize
      self.class.get("/oauth/authorize", {client_id: 2016, scope: "make_payments"})
    end

    def pay
      p @key
      p $key
      self.class.post("/payments", {access_token:$key, email: "soonerboy14@sbcglobal.net",note: "uberquick payment", amount: "0.01"})
    end

    def me
      self.class.get("/me?access_token=#{@key}")
    end
  end


end
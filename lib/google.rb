require 'httparty'

module Google

  class Client
    include HTTParty
    # base_uri 'maps.googleapis.com/maps/api/geocode'

    def initialize()
    end

    def get_latlong(address)
      address = address.split(" ").join("+")
      self.class.get("https://maps.googleapis.com/maps/api/geocode/json?address="+address+"&key=AIzaSyDIGvLonUnex7UgG5WH2ihTcMrTKi0P1L0")
    end

  end
end
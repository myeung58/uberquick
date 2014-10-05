# require 'httparty'

# module Venmo
#   class Client
#     include HTTParty
#     base_uri 'api.venmo.com/v1'

#     def initialize()
#       # @options = { query: {site: service, page: page} }
#     end

#     def authorize
#       self.class.get("/oauth/authorize", {client_id: 2016, scope: "make_payments"})
#     end

#     def me
#       self.class.get("/", {access_token: })
#     end

#   end
# end
require 'faraday'
require 'faraday_middleware'

module Mosaic
  module Foursquare
    class Object
      include Mosaic::Utils::Helpers

      class << self
        def conn
          @conn ||= Faraday.new('https://api.foursquare.com/v2/') do |faraday|
            faraday.request :url_encoded
            faraday.response :json, :content_type => /\bjson$/
            faraday.use Faraday::Response::RaiseError

            faraday.adapter Faraday.default_adapter
          end
        end

        def query(path, options)
          options = Mosaic::Foursquare.config.merge(options)
          self.request_count += 1
          response = conn.get path, options.merge(:v =>20130614)
          response.body
        end

        def request_count
          @request_count ||= 0
        end

        def request_count=(value)
          @request_count = value
        end
      end

      def initialize(attributes = {})
        attributes.each { |key,value| instance_variable_set("@#{underscore_string(key.to_s)}".to_sym, value) }
      end
    end
  end
end

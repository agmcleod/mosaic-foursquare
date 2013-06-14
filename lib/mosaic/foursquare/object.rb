require 'httparty'

module Mosaic
  module Foursquare
    class Object
      include Mosaic::Utils::Helpers
      include HTTParty
      base_uri 'https://api.foursquare.com/v2'

      class << self
        def query(path, options)
          options = Mosaic::Foursquare.config.merge(options)
          self.request_count += 1
          # STDERR.puts "REQUEST[#{self.request_count}]: #{path} with #{options.inspect}"
          response = get(path, :query => options.merge(:v =>20130614))
          # STDERR.puts "RESPONSE[#{self.request_count}]: #{response.inspect}"
          response.error! unless response.success?
          response
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

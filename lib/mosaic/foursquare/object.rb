require 'httparty'

module Mosaic
  module Foursquare
    class Object
      include HTTParty
      base_uri 'https://api.foursquare.com/v2'

      class << self
        def query(path, options)
          self.request_count += 1
          # STDERR.puts "REQUEST[#{self.request_count}]: #{path} with #{options.inspect}"
          response = get(path, :query => options)
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
        attributes.each { |key,value| instance_variable_set("@#{key.to_s.underscore}".to_sym, value) }
      end
    end
  end
end

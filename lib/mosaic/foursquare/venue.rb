require 'mosaic/foursquare/object'

module Mosaic
  module Foursquare
    class Venue < Mosaic::Foursquare::Object
      attr_reader :canonical_url, :created_at, :description, :id, :mayor, :name, :short_url, :stats, :tags, :url

      class << self
        def find(id, options = {})
          response = query("/venues/#{id}", options)
          self.new response['response']['venue']
        end
      end

      class Stats < Mosaic::Foursquare::Object
        attr_reader :checkins_count, :users_count, :tip_count
      end

      def initialize(attributes = {})
        super
        @mayor &&= Mosaic::Foursquare::User.new(@mayor['user'])
        @stats &&= Mosaic::Foursquare::Venue::Stats.new(@stats)
      end

      def herenow(options = {})
        response = self.class.query("/venues/#{id}/herenow", options)
        response['response']['hereNow']['items'].collect { |item| Mosaic::Foursquare::Checkin.new(item) }
      end
    end
  end
end

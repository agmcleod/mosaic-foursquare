require 'mosaic/foursquare/object'

module Mosaic
  module Foursquare
    class Venue < Mosaic::Foursquare::Object
      attr_accessor :canonical_url, :created_at, :description, :id, :location, :mayor, :name, :short_url, :stats, :tags, :url, :updates

      class << self
        def find(id, options = {})
          response = query("/venues/#{id}", options)
          self.new response['response']['venue']
        end
      end

      # locally defined location object (until general one is required)
      class Location < Mosaic::Foursquare::Object
        attr_reader :lat, :lng
      end

      # locally defined stats object (general one is probably not required)
      class Stats < Mosaic::Foursquare::Object
        attr_reader :checkins_count, :users_count, :tip_count
        attr_accessor :photos_count, :updates_count
      end

      def initialize(attributes = {})
        super
        self.location &&= Mosaic::Foursquare::Venue::Location.new(self.location)
        self.mayor &&= (self.mayor['user'] ? Mosaic::Foursquare::User.new(self.mayor['user']) : nil)
        self.stats &&= Mosaic::Foursquare::Venue::Stats.new(self.stats)
        if attributes["pageUpdates"]
          self.updates = Mosaic::Foursquare::Update.from_venue(attributes)
          self.stats.updates_count = attributes["pageUpdates"]["count"]
        end
        self.stats.photos_count = attributes["photos"]["count"] if attributes ["photos"]
        self
      end

      def herenow(options = {})
        response = self.class.query("/venues/#{id}/herenow", options)
        response['response']['hereNow']['items'].collect { |item| Mosaic::Foursquare::Checkin.new(item) }
      end

      def photos(options = {})
        response = self.class.query("/venues/#{id}/photos", options)
        response['response']['photos']['items'].collect { |item| Mosaic::Foursquare::Photo.new(item) }
      end

      def tips(options = {})
        response = self.class.query("/venues/#{id}/tips", options)
        response['response']['tips']['items'].collect { |item| Mosaic::Foursquare::Tip.new(item) }
      end
    end
  end
end

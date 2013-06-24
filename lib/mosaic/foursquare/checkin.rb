require 'mosaic/foursquare/object'

module Mosaic
  module Foursquare
    class Checkin < Mosaic::Foursquare::Object
      attr_accessor :created_at, :id, :photos, :shout, :user, :venue

      class << self
        def find(id, options = {})
          response = query("checkins/#{id}", options)
          self.new response['response']['checkin']
        end
      end

      def initialize(attributes = {})
        super
        self.photos &&= self.photos['items'].collect { |item| Mosaic::Foursquare::Photo.new(item) }
        self.user &&= Mosaic::Foursquare::User.new(self.user)
        self.venue &&= Mosaic::Foursquare::Venue.new(self.venue)
      end
    end
  end
end

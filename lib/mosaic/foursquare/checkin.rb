require 'mosaic/foursquare/object'

module Mosaic
  module Foursquare
    class Checkin < Mosaic::Foursquare::Object
      attr_accessor :created_at, :id, :photos, :shout, :user, :venue

      def initialize(attributes = {})
        super
        self.user &&= Mosaic::Foursquare::User.new(self.user)
        self.photos &&= self.photos['items'].collect { |item| Mosaic::Foursquare::Photo.new(item) }
      end
    end
  end
end

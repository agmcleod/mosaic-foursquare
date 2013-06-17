require 'mosaic/foursquare/object'

module Mosaic
  module Foursquare
    class Update < Mosaic::Foursquare::Object
      attr_accessor :id, :created_at, :shout, :photos

      class << self
        def from_venue(venue_response_data)
          venue_response_data["pageUpdates"]["items"].map do |update|
            new(update)
          end
        end
      end

      def initialize(attributes = {})
        super
        self.photos &&= self.photos['items'].collect { |item| Mosaic::Foursquare::Photo.new(item) }
      end
    end
  end
end
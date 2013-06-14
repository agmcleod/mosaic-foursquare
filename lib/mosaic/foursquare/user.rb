require 'mosaic/foursquare/object'

module Mosaic
  module Foursquare
    class User < Mosaic::Foursquare::Object
      attr_accessor :first_name, :id, :last_name, :photo

      def initialize(options = {})
        super
        self.photo &&= Mosaic::Foursquare::Photo.new(photo)
      end
    end
  end
end

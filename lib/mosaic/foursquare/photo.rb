require 'mosaic/foursquare/object'

module Mosaic
  module Foursquare
    class Photo < Mosaic::Foursquare::Object
      attr_accessor :id, :url, :visibility
    end
  end
end

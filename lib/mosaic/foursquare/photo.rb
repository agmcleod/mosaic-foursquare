require 'mosaic/foursquare/object'

module Mosaic
  module Foursquare
    class Photo < Mosaic::Foursquare::Object
      attr_accessor :id, :url, :visibility

      def url(size = "original")
        @url ||= @prefix.to_s + size + @suffix.to_s
      end
    end
  end
end

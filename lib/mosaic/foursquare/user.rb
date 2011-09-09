require 'mosaic/foursquare/object'

module Mosaic
  module Foursquare
    class User < Mosaic::Foursquare::Object
      attr_reader :id, :first_name, :last_name
    end
  end
end

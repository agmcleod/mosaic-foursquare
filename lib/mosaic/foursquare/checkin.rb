require 'mosaic/foursquare/object'

module Mosaic
  module Foursquare
    class Checkin < Mosaic::Foursquare::Object
      attr_accessor :created_at, :id, :shout, :user, :venue

      def initialize(attributes = {})
        super
        self.user &&= Mosaic::Foursquare::User.new(self.user)
      end
    end
  end
end
